class Project < ApplicationRecord
    validates :title, presence: {message: " must presence"}
    validates :project_desc, presence: {message: " must presence"}
    validates :fund_amount, numericality: { less_than_or_equal_to: 5000, message: " exceeded allowed funding amount." }
    validates :volunteer_number, numericality: { less_than_or_equal_to: 10, only_integer: true, message: " exceeded allowed number of volunteer." }
    # Project to Organizer Association
    has_many :organizer_project_joins
    has_many :organizers, through: :organizer_project_joins
    # Project to Donor Association
    has_many :donations
    has_many :donors, through: :donations
    # Project to Volunteer Association
    has_many :volunteer_project_joins
    has_many :volunteers, through: :volunteer_project_joins
    # Project to Category Association
    has_many :project_category_joins
    has_many :categories, through: :project_category_joins
    # Project to Skill/Causes/Professions Association 
    has_many :project_skill_joins
    has_many :skills, through: :project_skill_joins
    has_many :project_profession_joins
    has_many :professions, through: :project_profession_joins
    has_many :project_cause_joins
    has_many :causes, through: :project_cause_joins

    accepts_nested_attributes_for :project_skill_joins, allow_destroy: true
    accepts_nested_attributes_for :project_profession_joins, allow_destroy: true
    accepts_nested_attributes_for :project_cause_joins, allow_destroy: true
    accepts_nested_attributes_for :project_category_joins, allow_destroy: true

    enum status: ["applied", "pending", "approved", "rejected"]

    # validations
    validates :title, presence: true

    # gecode required to set latitude and logitude
    geocoded_by :address
    after_validation :geocode, :if => :address_changed?
    
    # Gem pg_search for searhable columns
    include PgSearch
    pg_search_scope :search_projects, against: [:title, :project_desc, :requirement_desc],
    associated_against: { 
        skills: [:name, :description],
        professions: [:name, :description],
        causes: [:name, :description],
        categories: [:name, :description]},
    using: [:tsearch]

    # Ge will_paginate for infiniate scrolling
    self.per_page = 8
    # CarrierWave Uploader
    mount_uploader :image, ImageUploader

    ##### custom methods for view purposes ######

    def fund_progress
        progress = (self.donations.sum(:amount) / self.fund_amount) * 100
    end

    def volunteer_progress
        progress = (self.volunteer_project_joins.count.to_f / self.volunteer_number.to_f) * 100
    end


    ##### admin panel custom label ######
    def custom_label
        "#{self.title}"
    end


    # create string from form inputs to use with geocode
    def address
        [address_1, address_2, city, state, country].compact.join(', ')
    end

    # if address changed update geocode
    def address_changed?
        address_1? || city_changed? || state_changed? || country_changed?
    end


end

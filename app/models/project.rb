class Project < ApplicationRecord

    # Project to Organizer Association
    has_many :organizer_project_joins
    has_many :organizers, through: :organizer_project_joins
    # Project to Donor Association
    has_many :donor_project_joins
    has_many :donors, through: :donor_project_joins
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

    enum status: ["applied", "pending", "validated", "rejected"]

    # validations
    validates :title, presence: true

    # gecode required to set latitude and logitude
    geocoded_by :address
    after_validation :geocode, :if => :address_changed?
    
    # Gem pg_search for searhable columns
    include PgSearch
    multisearchable :against => [:title, :project_desc, :requirement_desc]
    # Ge will_paginate for infiniate scrolling
    self.per_page = 8
    # CarrierWave Uploader
    mount_uploader :images, ImageUploader

    ##### custom methods for view purposes ######

    def fund_progress
        progress = (self.donor_project_joins.sum(:amount) / self.fund_amount) * 100
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
        [address_1, city, state, country].compact.join(', ')
    end

    # if address changed update geocode
    def address_changed?
        address_1? || city_changed? || state_changed? || country_changed?
    end


end

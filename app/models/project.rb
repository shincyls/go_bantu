class Project < ApplicationRecord


    #Project to Organizer Association
    has_many :organizer_project_joins
    has_many :organizers, through: :organizer_project_joins
    #Project to Donor Association
    has_many :donor_project_joins
    has_many :donors, through: :donor_project_joins
    #Project to Volunteer Association
    has_many :volunteer_project_joins
    has_many :volunteers, through: :volunteer_project_joins
    #Project to Category Association
    has_many :project_category_joins
    has_many :categories, through: :project_category_joins
    # validations
    
    validates :title, presence: true

    
    # Gem pg_search for searhable columns
    include PgSearch
    multisearchable :against => [:title, :project_desc, :requirement_desc]
    # Ge will_paginate for infiniate scrolling
    self.per_page = 8
    # CarrierWave Uploader
    mount_uploader :images, ImageUploader


    ##### admin panel custom label ######
    def custom_label
        "#{self.title}"
    end


    # scopes for search fields #
    def self.current_date
    current_date = DateTime.now
    Reservation.where("reservation_date >= ?", current_date)
    end

    def self.past_date
    current_date = DateTime.now
    Reservation.where("reservation_date < ?", current_date)
    end

    def self.stylist_name(stylist)
    Reservation.where("stylist_id = ?", stylist)
    end

    def self.date_range(minimum_date,max_date)
    Reservation.where("reservation_date >= ? AND reservation_date <= ?" ,minimum_date,max_date)
    end

    def self.service_name(service)
    Reservation.where("service_id = ?", service)
    end

    # title to create relation for booking appointment
    def self.stylist
        User.where(role: :admin)
    end

    # scope to find customers 
    def self.client
        User.where(role: :customer)
    end
        

end

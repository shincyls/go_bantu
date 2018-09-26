class Project < ApplicationRecord
    #validates :code, uniqueness: {message: "Dresscode already exists!"}, presence: {message: "Please enter dress code."}
    #validates :color, presence: {message: "Please enter dress color."}

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
    
    # Gem pg_search for searhable columns
    include PgSearch
    multisearchable :against => [:title, :project_desc, :requirement_desc]
    # Ge will_paginate for infiniate scrolling
    self.per_page = 8
    # CarrierWave Uploader
    mount_uploader :images, ImageUploader

end

class Volunteer < ApplicationRecord
    include VolunteersHelper

    validates :user_id, uniqueness: {message: "is already a volunteer!"}
    #General Association
    belongs_to :user
    #Volunteer to Project Association
    has_many :volunteer_project_joins
    has_many :projects, through: :volunteer_project_joins
    #Volunteer Skills / Causes / Professions
    has_many :volunteer_skill_joins
    has_many :skills, through: :volunteer_skill_joins
    has_many :volunteer_profession_joins
    has_many :professions, through: :volunteer_profession_joins
    has_many :volunteer_cause_joins
    has_many :causes, through: :volunteer_cause_joins

    accepts_nested_attributes_for :volunteer_skill_joins, allow_destroy: true
    accepts_nested_attributes_for :volunteer_profession_joins, allow_destroy: true
    accepts_nested_attributes_for :volunteer_cause_joins, allow_destroy: true

    # CarrierWave Uploader
    mount_uploader :cv_file, AttachmentUploader

    include PgSearch
    pg_search_scope :search_volunteers, against: [:description],
        associated_against: { 
            user: [:username, :first_name, :last_name, :email, :city, :state, :country],
            skills: [:name, :description],
            professions: [:name, :description],
            causes: [:name, :description]},
        using: [:tsearch]


    def custom_label
        "#{self.user.username}"
    end

    def url_protocol
        if self.linkedin_url.present?
        unless self.linkedin_url[/\Ahttp:\/\//] || self.linkedin_url[/\Ahttps:\/\//]
            self.linkedin_url = "https://#{self.linkedin_url}" 
        end
        end
        return self
    end

end

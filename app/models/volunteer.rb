class Volunteer < ApplicationRecord
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

    # CarrierWave Uploader
    mount_uploader :cv_file, AttachmentUploader

    include PgSearch
    pg_search_scope :search_volunteers, associated_against: { 
        user: [:username, :first_name, :last_name, :email, :city, :state, :country],
        skills: [:name, :description],
        professions: [:name, :description]},
        using: [:tsearch]


    def custom_label
        "#{self.user.username}"
    end
end

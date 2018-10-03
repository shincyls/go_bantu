class Organizer < ApplicationRecord
    #General Association
    belongs_to :user

    #Project to Organizer Association
    has_many :organizer_project_joins
    has_many :projects, through: :organizer_project_joins

    # validations
    validates :company_name, presence: true
    validates :email, presence: true
    # validates :phone_number1, presence: true

    #carrierwave uploader
    mount_uploader :logo, LogoUploader

    ##### admin panel custom label ######
    def custom_label
        "#{self.company_name}"
    end
end

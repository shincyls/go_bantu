class Organizer < ApplicationRecord
    include OrganizersHelper

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

    def url_protocol
        
        unless self.website_url[/\Ahttp:\/\//] || self.website_url[/\Ahttps:\/\//]
            self.website_url = "https://#{self.website_url}" if self.website_url
        end
        
        unless self.facebook_url[/\Ahttp:\/\//] || self.facebook_url[/\Ahttps:\/\//]
            self.facebook_url = "https://#{self.facebook_url}" if self.facebook_url
        end

        unless self.instagram_url[/\Ahttp:\/\//] || self.instagram_url[/\Ahttps:\/\//]
            self.instagram_url = "https://#{self.instagram_url}" if self.instagram_url
        end

        unless self.twitter_url[/\Ahttp:\/\//] || self.twitter_url[/\Ahttps:\/\//]
            self.twitter_url = "https://#{self.twitter_url}" if self.twitter_url
        end

        unless self.linkedin_url[/\Ahttp:\/\//] || self.linkedin_url[/\Ahttps:\/\//]
            self.linkedin_url = "https://#{self.linkedin_url}" if self.linkedin_url
        end

        return self

    end

end

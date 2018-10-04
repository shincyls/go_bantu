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
        
        if self.website_url != ""
            unless self.website_url[/\Ahttp:\/\//] || self.website_url[/\Ahttps:\/\//]
                self.website_url = "https://#{self.website_url}" 
            end
        end
        
        if self.facebook_url != ""
            unless self.facebook_url[/\Ahttp:\/\//] || self.facebook_url[/\Ahttps:\/\//]
                self.facebook_url = "https://#{self.facebook_url}"
            end
        end

        if self.instagram_url != ""
            unless self.instagram_url[/\Ahttp:\/\//] || self.instagram_url[/\Ahttps:\/\//]
                self.instagram_url = "https://#{self.instagram_url}"
            end
        end

        if self.twitter_url != ""
            unless self.twitter_url[/\Ahttp:\/\//] || self.twitter_url[/\Ahttps:\/\//]
                self.twitter_url = "https://#{self.twitter_url}"
            end
        end

        if self.linkedin_url != ""
            unless self.linkedin_url[/\Ahttp:\/\//] || self.linkedin_url[/\Ahttps:\/\//]
                self.linkedin_url = "https://#{self.linkedin_url}"
            end
        end

        return self

    end

end

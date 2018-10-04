class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    #Validate The Format and Presence of Required Information
    validates :email, uniqueness: {message: "Account already exists!"}, format: {with: /.+@.+\..+/, message: ": Please enter a valid email address."}, presence: {message: ": Please enter your email address."}
    
    validates :username, presence: :true, uniqueness: { case_sensitive: false }
    validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
    

    validates :first_name, presence: {message: ": Please enter your first name."}
    validates :last_name, presence: {message: ": Please enter your last name."}
	
    enum role: ["admin", "user"]

    mount_uploader :avatar, AvatarUploader

    # General Association
    has_one :organizer
    has_one :volunteer
    has_one :donor
 

    # gecode required to set latitude and logitude
    geocoded_by :address
    after_validation :geocode, :if => :address_changed?

    # create string from form inputs to use with geocode
    def address
    [address_1, city, state, country].compact.join(', ')
    end

    # if address changed update geocode
    def address_changed?
    address_1? || city_changed? || state_changed? || country_changed?
    end


    ##### admin panel custom label ######
    def custom_label
        "#{self.username}"
    end

    def full_name
        first_name + " " + last_name
    end
        
end
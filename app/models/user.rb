class User < ApplicationRecord
include OmniauthAttributesConcern
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable, authentication_keys: [:login]

    #  for username and email login
    attr_writer :login
        
    #  for friendly id
    extend FriendlyId
    friendly_id :full_name, use: :slugged
    

    #Validate The Format and Presence of Required Information
    validates :email, uniqueness: {message: "Account already exists!"}, format: {with: /.+@.+\..+/, message: ": Please enter a valid email address."}, presence: {message: ": Please enter your email address."}
    validates :username, presence: :true, uniqueness: { case_sensitive: false }
    validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
    validate :validate_username
	# validates :username, uniqueness: {message: ": Username already exists!"}, presence: {message: ": Please enter your username."}
    validates :first_name, presence: {message: ": Please enter your first name."}
    validates :last_name, presence: {message: ": Please enter your last name."}

    enum role: ["admin", "user"]

    mount_uploader :avatar, AvatarUploader

    # General Association
    has_one :organizer
    has_one :volunteer
    has_one :donor
    has_many :user_cause_joins
    has_many :causes, through: :user_cause_joins

    has_many :user_authentications, dependent: :destroy
    

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

   
# using username and email
    def login
        @login || self.username || self.email
    end
     


    def self.find_first_by_auth_conditions(warden_conditions)
        conditions = warden_conditions.dup
        if login = conditions.delete(:login)
            where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
        else
            if conditions[:username].nil?
             where(conditions).first
            else
             where(username: conditions[:username]).first
            end
        end
    end
    
    def validate_username
        if User.where(email: username).exists?
            errors.add(:username, :invalid)
        end
    end

    #   omniauth
    def self.create_from_omniauth(params)
        self.send(params.provider,params)
    end

        
end
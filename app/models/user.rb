class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    #Validate The Format and Presence of Required Information
    validates :email, uniqueness: {message: "Account already exists!"}, format: {with: /.+@.+\..+/, message: ": Please enter a valid email address."}, presence: {message: ": Please enter your email address."}
	validates :username, uniqueness: {message: ": Username already exists!"}, presence: {message: ": Please enter your username."}
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


end
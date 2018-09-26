class Cause < ApplicationRecord
    # User to Cause Association
    has_many :user_cause_joins
    has_many :users, through: :user_cause_joins
<<<<<<< HEAD
    # validations
    validates_uniqueness_of :name
  	validates :name, presence: true

  	##### admin panel custom label ######
    def custom_label
        "#{self.name}"
    end
 
=======
    # To Project Association
	has_many :project_cause_joins
    has_many :projects, through: :project_cause_joins
>>>>>>> be2ee96d90eaa5062aa0ccd9efbcdebabeff3e2a
end

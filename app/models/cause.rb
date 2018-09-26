class Cause < ApplicationRecord

    #User to Cause Association
    has_many :user_cause_joins
    has_many :users, through: :user_cause_joins
    # validations
    validates_uniqueness_of :name
  	validates :name, presence: true

  	##### admin panel custom label ######
    def custom_label
        "#{self.name}"
    end
 
end

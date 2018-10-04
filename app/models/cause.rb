class Cause < ApplicationRecord
    # User to Cause Association
    has_many :volunteer_cause_joins
    has_many :volunteers, through: :volunteer_cause_joins
    # To Project Association
    has_many :project_cause_joins
    has_many :projects, through: :project_cause_joins

    # validations
    validates_uniqueness_of :name
    validates :name, presence: true

  	##### admin panel custom label ######
    def custom_label
        "#{self.name}"
    end

end

class Cause < ApplicationRecord
    # User to Cause Association
    has_many :user_cause_joins
    has_many :users, through: :user_cause_joins
    # To Project Association
	has_many :project_cause_joins
    has_many :projects, through: :project_cause_joins
end

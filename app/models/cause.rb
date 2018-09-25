class Cause < ApplicationRecord

    #User to Cause Association
    has_many :user_cause_joins
    has_many :users, through: :user_cause_joins
 
end

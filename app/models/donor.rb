class Donor < ApplicationRecord
    #General Association
    belongs_to :user
    #Volunteer to Project Association
    has_many :donor_project_joins
    has_many :projects, through: :donor_project_joins
end

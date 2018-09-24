class Organizer < ApplicationRecord
    #General Association
    belongs_to :user
    #Project to Organizer Association
    has_many :organizer_project_joins
    has_many :projects, through: :organizer_project_joins
end

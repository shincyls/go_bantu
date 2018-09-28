class Volunteer < ApplicationRecord
    #General Association
    belongs_to :user
    #Volunteer to Project Association
    has_many :volunteer_project_joins
    has_many :projects, through: :volunteer_project_joins
    #Volunteer Skills / Causes / Professions
    has_many :volunteer_skill_joins
    has_many :skills, through: :volunteer_skill_joins
    has_many :volunteer_profession_joins
    has_many :professions, through: :volunteer_profession_joins

    accepts_nested_attributes_for :volunteer_skill_joins, allow_destroy: true, reject_if: proc { |attributes| attributes['skill_id'] == "0" }

    def custom_label
        "#{self.user.username}"
    end
end

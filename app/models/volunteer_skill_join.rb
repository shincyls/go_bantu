class VolunteerSkillJoin < ApplicationRecord
	belongs_to :volunteer
    belongs_to :skill
end

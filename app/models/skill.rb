class Skill < ApplicationRecord
	#General Association
    has_many :volunteer_skill_joins
  	has_many :volunteers, through: :volunteer_skill_joins
end

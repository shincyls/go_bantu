class Profession < ApplicationRecord
	#General Association
    has_many :volunteer_profession_joins
  	has_many :volunteers, through: :volunteer_profession_joins
end

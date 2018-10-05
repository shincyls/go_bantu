class VolunteerCauseJoin < ApplicationRecord
	belongs_to :volunteer
	belongs_to :cause
end

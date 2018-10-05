class VolunteerProjectJoin < ApplicationRecord
    belongs_to :volunteer
    belongs_to :project
end

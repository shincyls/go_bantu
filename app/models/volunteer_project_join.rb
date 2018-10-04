class VolunteerProjectJoin < ApplicationRecord
    belongs_to :volunteer
    belongs_to :project

    enum status: ["interested", "approved", "rejected"]
end

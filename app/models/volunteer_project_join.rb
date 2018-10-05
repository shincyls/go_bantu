class VolunteerProjectJoin < ApplicationRecord
    validates :volunteer_id, uniqueness: { scope: :project_id, message: " to this project has been requested, kindly please be waited for your update." }
    
    belongs_to :volunteer
    belongs_to :project

    enum status: ["interested", "approved", "rejected"]
end

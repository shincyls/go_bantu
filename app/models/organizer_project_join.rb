class OrganizerProjectJoin < ApplicationRecord
    belongs_to :organizer
    belongs_to :project
end

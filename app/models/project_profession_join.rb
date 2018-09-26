class ProjectProfessionJoin < ApplicationRecord
    belongs_to :project
    belongs_to :profession
end

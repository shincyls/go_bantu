class DonorProjectJoin < ApplicationRecord
    belongs_to :donor
    belongs_to :project
end

class Donation < ApplicationRecord
    belongs_to :donor
    belongs_to :project
    enum status: ["submitted", "paid"]
end

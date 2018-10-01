class Donor < ApplicationRecord
    #General Association
    belongs_to :user
    #Volunteer to Project Association
    has_many :donations
    has_many :projects, through: :donations

    def custom_label
        "#{self.user.username}"
    end
end

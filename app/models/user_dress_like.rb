class UserDressLike < ApplicationRecord
    belongs_to :user
    belongs_to :dress
end

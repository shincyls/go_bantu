class AuthenticationProvider < ApplicationRecord
    has_many :social_accounts, dependent: :destroy
    has_many :users, dependent: :destroy
    has_many :user_authentications, dependent: :destroy

    scope :get_provider_name, -> (provider_name) {where("name = ?",provider_name)}
end

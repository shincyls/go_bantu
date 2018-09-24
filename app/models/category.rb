class Category < ApplicationRecord
    #Project to Category Association
    has_many :project_category_joins
    has_many :projects, through: :project_category_joins
end

class ProjectCategoryJoin < ApplicationRecord
	belongs_to :project
    belongs_to :category
end

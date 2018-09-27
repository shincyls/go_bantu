class Category < ApplicationRecord
    #Project to Category Association
    has_many :project_category_joins
    has_many :projects, through: :project_category_joins
    # validations
    validates_uniqueness_of :name
  	validates :name, presence: true

  	 ##### admin panel custom label ######
    def custom_label
        "#{self.name}"
    end
end

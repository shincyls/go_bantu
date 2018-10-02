class Skill < ApplicationRecord

	# General Association
    has_many :volunteer_skill_joins
    has_many :volunteers, through: :volunteer_skill_joins
    has_many :project_skill_joins
    has_many :projects, through: :project_skill_joins

  	validates_uniqueness_of :name
    validates :name, presence: true

  	##### admin panel custom label ######
    def custom_label
        "#{self.name}"
    end

end

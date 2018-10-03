class Profession < ApplicationRecord
 #General Association
  has_many :volunteer_profession_joins
  has_many :volunteers, through: :volunteer_profession_joins
  # To Project Association
  has_many :project_profession_joins
  has_many :projects, through: :project_profession_joins
	# validations
	validates_uniqueness_of :name
  validates :name, presence: true

	##### admin panel custom label ######
  def custom_label
    "#{self.name}"
  end

end

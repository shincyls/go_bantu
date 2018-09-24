class CreateVolunteerSkillJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteer_skill_joins do |t|
      t.references :volunteer, index: true
      t.references :skill, index: true
      t.timestamps
    end
  end
end

class CreateProjectSkillJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :project_skill_joins do |t|
      t.references :project
      t.references :skill
      t.timestamps
    end
  end
end

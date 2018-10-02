class CreateProjectSkillJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :project_skill_joins do |t|
      t.references :project, index: true
      t.references :skill, index: true
      t.string :remarks
      t.timestamps
    end
  end
end

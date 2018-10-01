class CreateProjectCauseJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :project_cause_joins do |t|
      t.references :project, index: true
      t.references :cause, index: true
      t.string :remarks
      t.timestamps
    end
  end
end

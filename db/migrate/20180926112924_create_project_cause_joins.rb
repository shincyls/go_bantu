class CreateProjectCauseJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :project_cause_joins do |t|
      t.references :project
      t.references :cause
      t.timestamps
    end
  end
end

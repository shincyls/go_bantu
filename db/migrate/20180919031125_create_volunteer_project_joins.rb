class CreateVolunteerProjectJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteer_project_joins do |t|
      t.references :volunteer, index: true
      t.references :project, index: true
      t.integer :status #enums interested, applied, matched, contacted, assigned
      t.timestamps
    end
  end
end

class CreateVolunteerProjectJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :volunteer_project_joins do |t|
      t.references :volunteer, index: true
      t.references :project, index: true
      t.string :status #applied, matched, contacted, assigned?
      t.timestamps
    end
  end
end

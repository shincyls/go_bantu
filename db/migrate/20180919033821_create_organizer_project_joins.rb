class CreateOrganizerProjectJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :organizer_project_joins do |t|
      t.references :organizer, index: true
      t.references :project, index: true
      t.string :status
      t.timestamps
    end
  end
end

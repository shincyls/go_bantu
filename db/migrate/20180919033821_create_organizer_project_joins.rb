class CreateOrganizerProjectJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :organizer_project_joins do |t|
      t.references :organizer, index: true
      t.references :project, index: true
      t.integer :status
      t.string :remarks
      t.string :admin_remarks
      t.timestamps
    end
  end
end

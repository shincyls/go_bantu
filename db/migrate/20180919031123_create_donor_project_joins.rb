class CreateDonorProjectJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :donor_project_joins do |t|
      t.references :donor, index: true
      t.references :project, index: true
      t.float :amount
      t.integer :status #enums holding, processed
      t.timestamps
    end
  end
end

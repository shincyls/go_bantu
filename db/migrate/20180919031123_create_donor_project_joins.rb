class CreateDonorProjectJoins < ActiveRecord::Migration[5.2]
  def change
    create_table :donor_project_joins do |t|
      t.references :donor, index: true
      t.references :project, index: true
      t.float :amount
      t.string :payment_status #holding, processed
      t.timestamps
    end
  end
end

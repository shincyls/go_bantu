class CreateDonations < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.references :donor, index: true
      t.references :project, index: true
      t.float :amount
      t.integer :status, default: 0 #enums holding, processed
      t.timestamps
    end
  end
end

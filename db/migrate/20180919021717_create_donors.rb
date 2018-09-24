class CreateDonors < ActiveRecord::Migration[5.2]
  def change
    create_table :donors do |t|
      ## Donor Information
      t.references :user, index: true
      t.string :place_holder1
      t.string :place_holder2
      t.string :place_holder3
      t.timestamps
    end
  end
end

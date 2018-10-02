class CreateOrganizers < ActiveRecord::Migration[5.2]
  def change
    create_table :organizers do |t|
      ## User non-authenticatable
      t.references :user, index: true
      t.string :company_name
      t.string :email
      t.string :phone_number1
      t.string :phone_number2
      t.string :facebook_link
      t.string :instagram_link
      t.string :twitter_link
      t.string :linkedin_link

      ## Location (temporary allow to key anything)
      t.string :address_1, limit: 32
      t.string :address_2, limit: 32
      t.string :postcode, limit: 5
      t.string :city #free to key-in
      t.string :state #select option
      t.string :country #select option
      
      t.timestamps
    end
  end
end

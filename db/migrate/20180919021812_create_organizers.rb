class CreateOrganizers < ActiveRecord::Migration[5.2]
  def change
    create_table :organizers do |t|
      ## User non-authenticatable
      t.references :user, index: true
      t.string :company_name
      t.string :email
      t.string :description
      t.string :phone_number1
      t.string :phone_number2
      t.integer :type #community, home, organization

      ## Organization Link (if any)
      t.string :website_url
      t.string :facebook_url
      t.string :instagram_url
      t.string :twitter_url
      t.string :linkedin_url

      ## Location (temporary allow to key anything)
      t.string :address_1, limit: 64
      t.string :address_2, limit: 64
      t.string :postcode, limit: 5
      t.string :city #free to key-in
      t.string :state #select option
      t.string :country #select option
      
      #image
      t.string :logo
      
      t.timestamps
    end
  end
end

class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :street_one
      t.string :street_two
      t.string :city
      t.string :state
      t.integer :zipcode
      t.integer :phone_number
      t.string :email
      t.string :description
      t.string :profile_pic

      t.timestamps null: false
    end
  end
end

class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :surname_prefix
      t.date :date_of_birth
      t.string :address_street
      t.string :address_postal_code
      t.string :address_city
      t.string :email
      t.string :telephone_number
      t.boolean :male
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

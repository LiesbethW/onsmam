class AddPasswordToPeople < ActiveRecord::Migration
  def change
    add_column :people, :encrypted_password, :string
  end
end

class AddInsuranceAndBsnToPeople < ActiveRecord::Migration
  def change
    add_column :people, :insurance_no, :string
    add_column :people, :bsn, :string
  end
end

require 'rails_helper'

RSpec.describe Person, :type => :model do
  it "returns full name for person with surname prefix" do
    jan = Person.new(first_name: 'Jan', last_name:"Vries", surname_prefix: "de")
    expect(jan.name).to eq "Jan de Vries"
  end
  it "returns full name for person with no surname prefix" do
    jan = Person.new(first_name: 'Jan', last_name:"Vries")
    expect(jan.name).to eq "Jan Vries"
  end
  it "is valid if e-mailadres is valid" do
    jan = Person.new(first_name: 'Jan', last_name:"Vries", surname_prefix: "de", email:"jandevries@voorbeeld.nl")
    expect(jan.valid?).to be true
  end
  it "is invalid if e-mailadres is invalid" do
    jan = Person.new(first_name: 'Jan', last_name:"Vries", surname_prefix: "de", email:"jandevries@voorbeeldnl")
    expect(jan.valid?).to be false
  end
end

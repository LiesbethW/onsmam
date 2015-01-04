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
end

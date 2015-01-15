require 'rails_helper'

RSpec.describe Patient, :type => :model do 
  before :each do
    @lois = Patient.create!(first_name: 'Lois', last_name:"Lane", bsn: '123456789')
  end

  it "enforces a unique BSN" do
    clark = Patient.new(first_name: 'Clark', last_name: 'Kent', bsn: '123456789')
    expect(clark).to have(1).error_on(:bsn)
  end

  it 'allow multiple blank BSNs' do
    kwik = Patient.create!(first_name: "Kwik", last_name: "Duck", bsn: '')
    kwek = Patient.new(first_name: "Kwek", last_name: "Duck", bsn: '')
    expect(kwek.save).to be true
  end

  it "requires a BSN to have 9 characters" do
    lois = Patient.new(first_name: 'Clark', last_name: 'Kent', bsn: '12345678')
    expect(lois).to have(1).error_on(:bsn)
  end

  it "has the patient type" do
    expect(@lois.type).to eq 'Patient'
  end
  
end
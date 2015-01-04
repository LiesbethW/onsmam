require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has the user type" do
    henk = User.new()
    expect(henk.type).to eq "User"
  end
  it "requires an email address" do
    henk = User.new() 
    expect(henk).to have(1).error_on(:email)
  end
  it "enforces a unique email address" do
    henk = User.create!(first_name: 'Henk', last_name:"Vries", surname_prefix: "de", email:"henkdevries@voorbeeld.nl", encrypted_password:"12345")
    henk2 = User.new(email:"henkdevries@voorbeeld.nl")
    expect(henk2).to have(1).error_on(:email)
  end
  it "requires an encrypted password" do
    henk = User.new()
    expect(henk).to have(1).error_on(:encrypted_password)
  end
end

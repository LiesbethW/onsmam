require 'rails_helper'

describe "the signin process", :type => :feature do 
 before :each do
  User.create!(first_name: 'Jan', last_name:"Vries", surname_prefix: "de", email:"jandevries@voorbeeld.nl", encrypted_password:"12345")
 end

 it "accepts a valid user-password combination" do
  visit "/sessions/new"
  expect(page.status_code).to eq 200
  fill_in 'email', :with => 'jandevries@voorbeeld.nl'
  fill_in 'password', :with => '12345'
  click_button 'Log in!'
  expect(page.current_path).to eq "/people"
 end

 it "accepts a valid user-password combination" do
  visit "/sessions/new"
  expect(page.status_code).to eq 200
  fill_in 'email', :with => 'jandevries@voorbeeld.nl'
  fill_in 'password', :with => '123456'
  click_button 'Log in!'
  expect(page.current_path).to eq "/sessions/new"
  expect(page).to have_text "Wrong username or password"
 end
  
end 
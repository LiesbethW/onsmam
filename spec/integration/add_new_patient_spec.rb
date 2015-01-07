require 'rails_helper'

RSpec.describe 'the process of adding a new patient', :type => :feature do 

  before :each do
    @jan = User.create!(first_name: 'Jan', last_name:"Vries", surname_prefix: "de", email:"jandevries@voorbeeld.nl", encrypted_password:"12345")
    login()
  end

  def login
    visit "/session/new"
    expect(page.status_code).to eq 200
    fill_in 'email', :with => @jan.email
    fill_in 'password', :with => '12345'
    click_button 'Log in!'
  end

  it 'Allows to add a new patient when clicking appropriate link on patient index page' do
    visit "/patients"
    expect(page).to have_link 'New patient'
    click_link 'New patient'
    expect(page.current_path).to eq '/patients/new'
    fill_in 'First name', :with => 'Karel'
    fill_in 'Last name', :with => 'Everhardt'
    click_button 'Add patient'
    expect(page.current_path).to eq '/patients'
    expect(page).to have_text('Karel Everhardt')
    expect(page).to have_text('Yay! A new patient!')
  end

  xit 'Shows error when trying to add patient without required params' do
    visit "/patients/new"
    fill_in 'First name', :with => 'Karel'
    click_button 'Add patient'
    expect(page.current_path).to eq '/patients'
    expect(page).to have_text("Last name is required")
  end
  
end
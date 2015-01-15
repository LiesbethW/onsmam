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

  it 'Shows error when trying to add patient without required params' do
    visit "/patients/new"
    fill_in 'First name', :with => 'Karel'
    click_button 'Add patient'
    expect(page).to have_text("Last name is required")
    fill_in 'Last name', :with => 'Kaas'
    click_button 'Add patient'
    expect(page).to have_text('Karel Kaas')
    expect(page).to have_text('Yay! A new patient!')    
  end

  it 'Shows patient details when I click the patients name in patient index' do
    #adds patient with certain details
    visit "/patients/new"
    fill_in 'First name', :with => 'Tommie'
    fill_in 'Last name', :with => 'Beer'
    fill_in 'BSN', :with => '838485868'
    choose('Male')
    fill_in 'Street and house number', :with => 'Sesamstraat 23'
    fill_in 'Postal code', :with => '1234AB'
    fill_in 'City', :with => 'Springville'
    fill_in 'E-mail address', :with => 'tommie@sesamstraat.nl'
    click_button 'Add patient'
    #return to index and click patient name
    expect(page.current_path).to eq '/patients'
    click_link('Tommie Beer')
    #expect to go to patient view
    expect(page).to have_text('Tommie Beer')
    expect(page).to have_text('Male')
    expect(page).to have_text('Sesamstraat 23')
    expect(page).to have_text('tommie@sesamstraat.nl')
  end
  
end
require 'rails_helper'

describe "the signin process", :type => :feature do 
  before :each do
    @jan = User.create!(first_name: 'Jan', last_name:"Vries", surname_prefix: "de", email:"jandevries@voorbeeld.nl", encrypted_password:"12345")
  end

  def login
    visit "/sessions/new"
    expect(page.status_code).to eq 200
    fill_in 'email', :with => @jan.email
    fill_in 'password', :with => '12345'
    click_button 'Log in!'
  end

  it "accepts a valid user-password combination" do
    login()
    expect(page.current_path).to eq "/people"
  end

  it "does not accept an invalid user-password combination" do
    visit "/sessions/new"
    expect(page.status_code).to eq 200
    fill_in 'email', :with => @jan.email
    fill_in 'password', :with => '123456'
    click_button 'Log in!'
    expect(page.current_path).to eq "/sessions/new"
    expect(page).to have_text "Wrong username or password"
  end

  it "redirects to signin page when user without session navigates to private page" do
    visit "/people"
    expect(page.current_path).to eq "/sessions/new"
  end

  it "redirects to logged in landing page when visiting login page with valid session" do
    login()
    visit "/sessions/new"
    expect(page.current_path).to eq "/people"
  end
  
  it "shows a logout button when logged in and redirects to sessions/new upon clicking it" do
    login()
    expect(page).to have_link('Log out')
    click_link 'Log out'
    expect(page.current_path).to eq "/sessions/new"
    expect(page).to have_text("Logged out")
  end

  it "does not show a logout button when not logged in" do
    visit "/sessions/new"
    expect(page).to_not have_link('Log out')
  end
end 
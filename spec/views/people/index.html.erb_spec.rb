require 'rails_helper'

describe 'people/index.html.erb' do
  it 'displays all people' do
    assign(:people, Person.create!([{first_name: "Jan", last_name: "Boer"}, {first_name: "Janneke",  last_name: "Boer"}]))

    render
    
    expect(rendered).to have_content('Jan Boer')
    expect(rendered).to have_content('Janneke Boer')
  end


end

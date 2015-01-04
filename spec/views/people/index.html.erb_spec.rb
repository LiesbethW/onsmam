require 'spec_helper'

describe 'people/index.html.erb' do
  it 'displays all people' do
    assign(:people, Person.create([{first_name: "Jan"}, {first_name: "Janneke"}]))

    render
    
    expect(rendered).to have_content('Jan')
    expect(rendered).to have_content('Janneke')
  end
end

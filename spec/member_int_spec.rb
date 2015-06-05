require('capybara/rspec')
require('./app')
Capybara.app == Sinatra::Application
set(:show_exceptions, false)

describe('enter in a new team', {:type => :feature}) do
  it('processes the user entry to add a new team') do
    visit('/')
    fill_in('team', :with => 'the')
    click_button('Send')
    expect(page).to have_content('the')
  end
end

describe('select a team from the list and continue on to team page', {:type => :feature}) do
  it('processes the users entry and move to a selected page') do
    visit('/')
    click_link('the')
    expect(page).to have_content('Here are')
  end
end

describe('return to the index page', {:type => :feature}) do
  it('will return to index page when link is depressed') do
    visit('/')
    click_link('the')
    click_link('Return to Main Page')
    expect(page).to have_content('Team Tracker')
  end
end

describe('return to the team page after a new member is entered', {:type => :feature}) do
  # it('will return to member page when after form is filled in') do
  #   visit('/')
  #   click_link('the')
  #   fill_in('first', :with => "Bob")
  #   fill_in('last', :with => "Smith")
  #   fill_in('phone', :with => "503")
  #   click_button('Send')
  #   expect(page).to have_content('Here are')
  # end
end

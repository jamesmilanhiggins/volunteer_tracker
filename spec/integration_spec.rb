require "capybara/rspec"
require "./app"
require "pry"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new project', {:type => :feature}) do
  it('allows a user to create a new project') do
    visit('/')
    expect(page).to have_content('Welcome to the Project Manager Application')
  end
end

require "capybara/rspec"
require "./app"
require "pry"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('visiting homepage', {:type => :feature}) do
  it('shows text on index') do
    visit('/')
    expect(page).to have_content('Welcome to the Project Manager Application')
  end
end
describe('adding a new project', {:type => :feature}) do
  it('allows a user to create a new project') do
    visit('/')
    click_link('Add New Project')
    fill_in('project_name', :with => 'James')
    click_button('Add Project')
    expect(page).to have_content('Success!')
  end
end
describe('viewing projects that have been created', {:type => :feature}) do
  it('allows a user to view the projects') do
    visit('/')
    click_link('View All Projects')
    expect(page).to have_content('Your Current Projects')
  end
end



# describe('viewing projects that have been created', {:type => :feature}) do
#   it('allows a user to view the projects and click into an individual project') do
#     visit('/')
#     click_link('View All Projects')
#     project = Project.new({:project_name => 'home', :id => 1})
#     project.save
#     visit("/project/#{project.id}")
#     expect(page).to have_content('home')
#   end
# end

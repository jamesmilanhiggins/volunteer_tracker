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

describe('the project deletion path', {:type => :feature}) do
  it('deletes a project') do
    test_project = Project.new({:project_name => "test project", :id => nil})
    test_project.save
    id = test_project.id
    visit "/projects/#{id}/edit"
    click_button('Delete project')
    expect(page).to have_content('Welcome')
  end
end

describe('the volunteer deletion path', {:type => :feature}) do
  it ('deletes a volunteer') do
    test_project = Project.new({:project_name => "test project", :id => nil})
    test_project.save
    project_id = test_project.id.to_i
    test_volunteer = Volunteer.new({:volunteer_name => "james", :project_id => project_id, :id => nil})
    test_volunteer.save
    visit "/projects/#{project_id}"
    click_link("james")
    click_button('Delete this volunteer')
    expect(page).to have_content('Welcome')
  end
end

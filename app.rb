require 'sinatra'
require 'sinatra/reloader'
require './lib/volunteer'
require './lib/project'
require 'pg'
require 'pry'

also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "volunteer_tracker"})


get('/') do
  erb(:index)
end

get('/projects/new') do
  erb(:project_form)
end

post('/projects') do
  project_name = params.fetch("project_name")
  test_project = Project.new({:project_name => project_name, :id => nil})
  test_project.save
  erb(:success)
end

get('/projects') do
  @projects = Project.all
  erb(:projects)
end

get('/projects/:id') do
  @project = Project.find(params.fetch("id").to_i)
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params.fetch("id").to_i)
  erb(:project_edit)
end

patch("/projects/:id") do
  project_name = params.fetch("project_name")
  @project = Project.find(params.fetch("id").to_i)
  @project.update(:project_name => project_name)
  erb(:project)
end

delete("/projects/:id") do
  @project = Project.find(params.fetch("id").to_i)
  @project.delete
  erb(:index)
end

post("/volunteers_add") do
  volunteer_name = params.fetch("volunteer_name")
  project_id = params.fetch("project_id").to_i
  @project = Project.find(project_id)
  @volunteer = Volunteer.new({:volunteer_name => volunteer_name, :project_id => project_id})
  @volunteer.save
  erb(:success)
end


get('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch("id").to_i)
  erb(:volunteer)
end

patch("/volunteers/:id") do
  volunteer_id = params.fetch("id").to_i
  volunteer = Volunteer.find(volunteer_id)
  volunteer_name = params.fetch("volunteer_name")
  volunteer.update({:volunteer_name => volunteer_name})
  @volunteer = Volunteer.find(volunteer_id)
  erb(:success)
end

delete("/volunteers/:id") do
  volunteer_id = params.fetch("id").to_i
  volunteer = Volunteer.find(volunteer_id)
  volunteer.delete
  erb(:index)
end

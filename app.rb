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

require 'sinatra'
require 'sinatra/reloader'
also_reload 'lib/**/*.rb'
require './lib/project'
require './lib/volunteer'
require 'pg'
require 'pry'

DB = PG.connect({dbname: 'volunteer_tracker'})

#get the homepage
get('/') do
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end


# add projects on the homepage
post('/projects') do
  project_name = params.fetch('project_name')
  project1 = Project.new({project_name: project_name, id: nil})
  project1.save
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end

# click on a link to see a project
get('/projects/:id') do
  @project = Project.find(params.fetch('id').to_i)
  @projects = Project.all
  erb(:project)
end

# click to modify/delete a project
get('/projects/:id/edit') do
  @project = Project.find(params.fetch('id').to_i)
  @projects = Project.all
  erb(:project_edit)
end

# apply an updated name to the Project
patch('/projects/:id') do
  project_name = params.fetch('project_name')
  @project = Project.find(params.fetch('id').to_i)
  @project.update({project_name: project_name})
  @projects = Project.all
  erb(:project)
end

# delete a project, go to homepage
delete('/projects/:id') do
  @project = Project.find(params.fetch('id').to_i)
  @project.delete
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end

# add a volunteer from homepage (under add volunteers to a project)
post('/volunteers') do
  volunteer_name = params.fetch('volunteer_name')
  project_id = params.fetch('project_id').to_i
  volunteer = Volunteer.new({volunteer_name: volunteer_name, project_id: project_id, id: nil})
  volunteer.save
  @project = Project.find(project_id)
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end

# see page for a specific volunteer by clicking their link from homepage
get('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch('id').to_i)
  @volunteers = Volunteer.all
  erb(:volunteer)
end

# see page for editing/deleting volunteer
get('/volunteers/:id/edit') do
  @volunteer = Volunteer.find(params.fetch('id').to_i)
  @volunteers = Volunteer.all
  erb(:volunteer_edit)
end

# update the name of the volunteer
patch('/volunteers/:id') do
  volunteer_name = params.fetch('volunteer_name')
  id = params.fetch('id').to_i
  @volunteer = Volunteer.find(params.fetch('project_id').to_i)
  @volunteer.update({volunteer_name: volunteer_name})
  @volunteers = Volunteer.all
  erb(:volunteer)
end

# delete the namne of the volunteer, go home
delete('/volunteers/:id') do
  @volunteer = Volunteer.find(params.fetch('project_id').to_i)
  @volunteer.delete
  @projects = Project.all
  @volunteers = Volunteer.all
  erb(:index)
end

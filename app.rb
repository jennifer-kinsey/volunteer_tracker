require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/project')
require('./lib/volunteer')
require('pg')

DB = PG.connect({dbname: 'volunteer_tracker'})

get('/') do
  @projects = Project.all
  erb(:index)
end

post('/projects') do
  project_name = params.fetch('project_name')
  project1 = Project.new({project_name: project_name, id: nil})
  project1.save
  @projects = Project.all
  erb(:index)
end

get('/projects/:id') do
  @project = Project.find(params.fetch('id').to_i)
  @projects = Project.all()
  erb(:project)
end

get('/projects/:id/edit') do
  @project = Project.find(params.fetch('id').to_i())
  @projects = Project.all()
  erb(:project_edit)
end

patch('/projects/:id') do
  project_name = params.fetch('project_name')
  @project = Project.find(params.fetch('id').to_i)
  @project.update({project_name: project_name})
  @projects = Project.all()
  erb(:project)
end

delete('/projects/:id') do
  @project = Project.find(params.fetch('id').to_i())
  @project.delete()
  @projects = Project.all()
  erb(:index)
end

post('/volunteers') do
  volunteer_name = params.fetch('volunteer_name')
  project_id = params.fetch('project_id').to_i()
  volunteer = Volunteer.new({volunteer_name: volunteer_name, project_id: project_id})
  volunteer.save()
  @project = Project.find(project_id)
  erb(:project)
end

delete('/volunteers/:id') do
  volunteer_name = params.fetch('volunteer_name')
  project_id = params.fetch('project_id').to_i()
  @volunteer = Volunteer.find(params.fetch('id').to_i)
  @volunteer.delete({volunteer_name: volunteer_name, project_id: project_id})
  erb(:project)
end

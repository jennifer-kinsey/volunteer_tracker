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

post('/lists') do
  project_name = params.fetch('project_name')
  project1 = Project.new({project_name: project_name, id: nil})
  project1.save
  @projects = Project.all
  erb(:index)
end

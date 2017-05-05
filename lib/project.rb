class Project
  attr_reader(:project_name, :id)

  define_method(:initialize) do |attributes|
    @project_name = attributes.fetch(:project_name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each() do |project|
      name = project.fetch("name")
      project = project.fetch("id").to_i()
      projects.push(Project.new({:project_name => project_name, :id => id}))
    end
    projects
  end
  
end

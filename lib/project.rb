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
      project_name = project.fetch("project_name")
      id = project.fetch("id").to_i()
      projects.push(Project.new({project_name: project_name, id: id}))
    end
    projects
  end

  def save
    result = DB.exec("INSERT INTO projects (project_name) VALUES ('#{@project_name}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  define_method(:==) do |another_project|
    self.project_name.==(another_project.project_name).&(self.id().==(another_project.id()))
  end



end

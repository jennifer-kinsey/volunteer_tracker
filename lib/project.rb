class Project
  attr_reader(:project_name, :id)

  def initialize(attributes)
    @project_name = attributes.fetch(:project_name)
    @id = attributes.fetch(:id)
  end

  def self.all
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

  def ==(another_project)
    self.project_name == another_project.project_name && self.id == another_project.id
  end

  def self.find(id)
    found_project = nil
    Project.all.each do |project|
      if project.id == id
        found_project = project
      end
    end
    found_project
  end

  def get_volunteers
    list_volunteers = []
    volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.project_id};")
    volunteers.each do |volunteer|
      volunteer_name = volunteer.fetch('volunteer_name')
      project_id = volunteer.fetch('project_id').to_i
      list_volunteers.push(Volunteer.new({volunteer_name: volunteer_name, project_id: project_id}))
    end
    list_volunteers
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE project_id = #{self.project_id};")
    DB.exec("DELETE FROM projects WHERE id = #{self.id};")
  end

  def update(attributes)
    @project_name = attributes.fetch(:project_name)
    @id = self.id
    DB.exec("UPDATE projects SET project_name = '#{@project_name}' WHERE id = #{@id};")
  end

end

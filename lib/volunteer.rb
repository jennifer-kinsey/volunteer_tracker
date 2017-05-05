class Volunteer

  attr_reader(:volunteer_name, :project_id)

  define_method(:initialize) do |attributes|
    @volunteer_name = attributes.fetch(:volunteer_name)
    @project_id = attributes.fetch(:project_id)
  end

  define_singleton_method(:all) do
    returned_volunteers = DB.exec('SELECT * FROM volunteers;')
    volunteers = []
    returned_volunteers.each() do  |vol|
      volunteer_name = vol.fetch('volunteer_name')
      project_id = vol.fetch('project_id').to_i()
      volunteers.push(Volunteer.new({:volunteer_name => volunteer_name, :project_id => project_id}))
    end
    volunteers
  end

  define_method(:==) do |another_vol|
    self.volunteer_name.==(another_vol.volunteer_name).&(self.project_id().==(another_vol.project_id))
  end

  define_method(:save) do
    DB.exec("INSERT INTO volunteers (volunteer_name, project_id) VALUES ('#{@volunteer_name}', #{@project_id});")
  end

end
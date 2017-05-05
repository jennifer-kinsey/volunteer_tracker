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

end

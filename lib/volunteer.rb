class Volunteer

  attr_reader(:volunteer_name, :project_id)

  def initialize (attributes)
    @volunteer_name = attributes.fetch(:volunteer_name)
    @project_id = attributes.fetch(:project_id)
  end

  def self.all
    returned_volunteers = DB.exec('SELECT * FROM volunteers;')
    volunteers = []
    returned_volunteers.each() do  |vol|
      volunteer_name = vol.fetch('volunteer_name')
      project_id = vol.fetch('project_id').to_i()
      volunteers.push(Volunteer.new({:volunteer_name => volunteer_name, :project_id => project_id}))
    end
    volunteers
  end

  def ==(another_vol)
    self.volunteer_name.==(another_vol.volunteer_name).&(self.project_id().==(another_vol.project_id))
  end

  def save
    DB.exec("INSERT INTO volunteers (volunteer_name, project_id) VALUES ('#{@volunteer_name}', #{@project_id});")
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{self.id()};")
  end

  def update(attributes)
    @volunteer_name = attributes.fetch(:volunteer_name)
    @project_id = attributes.fetch(:project_id)
    DB.exec("UPDATE volunteers SET volunteer_name = '#{@volunteer_name} WHERE project_id= #{@project_id}'")
  end

  def self.find(project_id)
    found_volunteer = nil
    Volunteer.all.each do |volunteer|
      if volunteer.project_id == project_id
        found_volunteer = volunteer
      end
    end
    found_volunteer
  end

end

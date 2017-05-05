class Volunteer

  attr_reader(:volunteer_name, :project_id)

  define_method(:initialize) do |attributes|
    @volunteer_name = attributes.fetch(:volunteer_name)
    @project_id = attributes.fetch(:project_id)
  end

  define_singleton_method(:all) do
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each do |volunteer|
      volunteer_name = volunteer.fetch("volunteer_name")
      project_id = volunteer.fetch("project_id").to_i
      volunteers.push(Volunteer.new({:volunteer_name => volunteer_name, :project_id => project_id}))
    end
    volunteers
  end

  define_method(:save) do
    DB.exec("INSERT INTO volunteers (volunteer_name, project_id) VALUES ('#{@volunteer_name}', #{@project_id});")
  end

  define_method(:==) do |another_volunteer|
    self.volunteer_name.==(another_volunteer.volunteer_name).&(self.project_id.==(another_volunteer.project_id))
  end

  # define_method(:update) do |attributes|
  #   @volunteer_name = attributes.fetch(:volunteer_name)
  #   DB.exec("UPDATE volunteers SET volunteer_name = '#{@name}' WHERE id = #{self.id};")
  # end


  define_singleton_method(:find) do |identification|
    Volunteer.all.each do |volunteer|
      if volunteer.volunteer_name == identification
        return volunteer
      end
    end
  end

  define_method(:update) do |attributes|
    @volunteer_name = attributes[:volunteer_name]
    @project_id = attributes[:project_id]
    DB.exec("UPDATE volunteers SET volunteer_name= '#{@volunteer_name}' WHERE project_id = #{@project_id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM volunteers WHERE id = #{self.id};")
  end

end

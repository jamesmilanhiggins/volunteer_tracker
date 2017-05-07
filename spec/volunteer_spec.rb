require('spec_helper')

describe(Volunteer) do
  describe(".all") do
    it("is empty at first") do
      expect(Volunteer.all).to(eq([]))
    end
  end

describe("#save") do
  it("adds a volunteer to the array of saved volunteers") do
    test_volunteer = Volunteer.new({:volunteer_name => "james", :project_id => 1, :id => nil})
    test_volunteer.save
    expect(Volunteer.all).to(eq([test_volunteer]))
  end
end

describe("#volunteer_name") do
  it("lets you give a volunteer name") do
    test_volunteer = Volunteer.new({:volunteer_name => "james", :project_id => 1, :id => nil})
    expect(test_volunteer.volunteer_name).to(eq("james"))
  end
end

describe("#project_id") do
  it("lets you read the project id") do
    test_volunteer = Volunteer.new({:volunteer_name => "james", :project_id => 1, :id => nil})
    expect(test_volunteer.project_id).to(eq(1))
  end
end

describe("#==") do
  it("is the same volunteer if it has the same volunteer_name ") do
    test_volunteer = Volunteer.new({:volunteer_name => "james", :project_id => 1, :id => nil})
    test_volunteer2 = Volunteer.new({:volunteer_name => "james", :project_id => 1, :id => nil})
    expect(test_volunteer).to(eq(test_volunteer2))
  end
end

describe(".find") do
  it("returns a volunteer by its name") do
    volunteer1 = Volunteer.new({:volunteer_name => "House", :project_id =>1, :id => nil})
    volunteer1.save
    volunteer2 = Volunteer.new({:volunteer_name => "Car", :project_id =>1, :id => nil})
    volunteer2.save
    expect(Volunteer.find(volunteer2.volunteer_name)).to(eq(volunteer2))
  end
 end


#

describe("#update") do
  it("updates the name of the volunteer")do
    test_volunteer = Volunteer.new({:volunteer_name => "james", :project_id => 1, :id => nil})
    test_volunteer.save
    test_volunteer.update({:volunteer_name => "mike", :project_id => 1, :id => nil})
    test_volunteer.save
    expect(test_volunteer.volunteer_name).to(eq("mike"))
  end
end

describe("#delete") do
  it("will remove the volunteer from the database") do
    test_volunteer = Volunteer.new({:volunteer_name => "james", :project_id => 1, :id => nil})
    test_volunteer.save
    test_volunteer.delete
    expect(Volunteer.all).to(eq([]))
    end
  end



end

require('spec_helper')

describe(Volunteer) do
  describe(".all") do
    it("is empty at first") do
      expect(Volunteer.all).to(eq([]))
    end
  end

describe("#save") do
  it("adds a volunteer to the array of saved volunteers") do
    test_volunteer = Volunteer.new({:volunteer_name => "james", :project_id => 1})
    test_volunteer.save
    expect(Volunteer.all).to(eq([test_volunteer]))
  end
end

describe("#volunteer_name") do
  it("lets you give a volunteer name") do
    test_volunteer = Volunteer.new({:volunteer_name => "james", :project_id => 1})
    expect(test_volunteer.volunteer_name).to(eq("james"))
  end
end

describe("#project_id") do
  it("lets you read the project id") do
    test_volunteer = Volunteer.new({:volunteer_name => "james", :project_id => 1})
    expect(test_volunteer.project_id).to(eq(1))
  end
end

end

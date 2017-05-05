require('spec_helper')

describe(Project) do
  describe(".all") do
    it("starts off with no projects") do
      expect(Project.all).to(eq([]))
    end
  end
  describe("#project_name") do
    it("tells you the name of the project") do
      project = Project.new({:project_name => "House", :id =>nil})
      expect(project.project_name).to(eq("House"))
    end
  end
describe("#id") do
  it("sets its ID when you save it") do
    project = Project.new({:project_name => "House", :id =>nil})
    project.save
    expect(project.id).to(be_an_instance_of(Fixnum))
  end
end

end

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

  describe("#save") do
    it("lets you save a project to the database") do
      project = Project.new({:project_name => "House", :id =>nil})
      project.save
      expect(Project.all).to(eq([project]))
    end
  end

  describe("#==") do
    it("is the same project if it has the same name") do
      project1 = Project.new({:project_name => "House", :id =>nil})
      project1.save
      project2 = Project.new({:project_name => "House", :id =>nil})
      project2.save
      expect(project1).to(eq(project2))
    end
  end







end

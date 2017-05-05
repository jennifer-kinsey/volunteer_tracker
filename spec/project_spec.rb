require 'spec_helper'

describe(Project) do

  describe('.all') do
    it('starts out with no projects') do
      expect(Project.all).to eq([])
    end
  end

  describe("#project_name") do
  it("returns the project name") do
    project1 = Project.new({project_name: "catch beetles for Beedle", id: nil})
    expect(project1.project_name).to eq("catch beetles for Beedle")
  end
end

describe("#id") do
  it("sets the project ID when you save it") do
    project = Project.new({project_name: "get 500 rupees", :id => nil})
    project.save()
    expect(project.id()).to(be_an_instance_of(Fixnum))
  end
end

  describe('#save') do
    it('saves the projects to the database') do
      project1 = Project.new({project_name: "take over Hyrule", id: nil})
      project1.save
      expect(Project.all).to eq([project1])
    end
  end

  describe('#==') do
    it("is the same project if the project name and id is the same") do
      project1 = Project.new({project_name: "obtain master sword", id: nil})
      project2 = Project.new({project_name: "obtain master sword", id: nil})
      expect(project1).to eq(project2)
    end
  end

  describe('.find') do
    it('returns a project by its ID') do
      project1 = Project.new({project_name: "fill all bottles with fairies", id: nil})
      project1.save
      project2 = Project.new({project_name: "collect 4 heart pieces", id: nil})
      project2.save
      expect(Project.find(project2.id)).to eq(project2)
    end
  end

end

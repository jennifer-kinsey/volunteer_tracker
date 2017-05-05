require 'spec_helper'

describe(Project) do

  describe('.all') do
    it('starts out with no projects') do
      expect(Project.all).to eq([])
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

end

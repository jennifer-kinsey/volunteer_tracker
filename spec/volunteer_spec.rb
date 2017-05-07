require 'spec_helper'

describe(Volunteer) do
  describe('.all') do
    it('is empty at first') do
      expect(Volunteer.all).to eq([])
    end
  end

  describe('#volunteer_name') do
    it('lets you give it a volunteer name') do
      test_vol = Volunteer.new({volunteer_name: 'Ganon', project_id: 1, id: 2})
      expect(test_vol.volunteer_name).to eq('Ganon')
    end
  end

  describe('#project_id') do
    it('lets you give it a project id') do
      test_vol = Volunteer.new({volunteer_name: 'Impa', project_id: 1, id: 3})
      expect(test_vol.project_id).to eq(1)
    end
  end

  describe('#id') do
    it('returns the unique id of the volunteer') do
      vol = Volunteer.new({volunteer_name: 'Impa', project_id: 1, id: 3})
      expect(vol.id).to eq(3)
    end
  end

  describe("#==") do
    it("is the same task if it has the same volunteer name and project id") do
      vol1 = Volunteer.new({volunteer_name: "Link", project_id: 1, id: 5})
      vol2 = Volunteer.new({volunteer_name: "Link", project_id: 1, id: 5})
      expect(vol1).to(eq(vol2))
    end
  end

  describe('#save') do
    it('adds a volunteers to an array of saved volunteers') do
      test_vol = Volunteer.new({volunteer_name: 'Princess Zelda', project_id: 1, id: 5})
      test_vol.save
      expect(Volunteer.all).to eq([test_vol])
    end
  end



end

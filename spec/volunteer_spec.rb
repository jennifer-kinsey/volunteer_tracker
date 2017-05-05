require 'spec_helper'

describe(Volunteer) do
  describe('.all') do
    it('is empty at first') do
      expect(Volunteer.all).to eq([])
    end
  end

  describe("#==") do
    it("is the same task if it has the same volunteer name and project id") do
      vol1 = Volunteer.new({:volunteer_name => "Link", :project_id => 1})
      vol2 = Volunteer.new({:volunteer_name => "Link", :project_id => 1})
      expect(vol1).to(eq(vol2))
    end
  end

  describe('#save') do
    it('adds a volunteers to an array of saved volunteers') do
      test_vol = Volunteer.new({:volunteer_name => 'Princess Zelda', :project_id => 1})
      test_vol.save
      expect(Volunteer.all).to eq([test_vol])
    end
  end

end

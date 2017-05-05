require 'spec_helper'

describe(Volunteer) do
  describe('.all') do
    it('is empty at first') do
      expect(Volunteer.all).to eq([])
    end
  end
end

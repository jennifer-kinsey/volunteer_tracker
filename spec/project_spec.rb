require 'spec_helper'

describe(Project) do

  describe('.all') do
    it('starts out with no projects') do
      expect(Project.all).to eq([])
    end
  end

end

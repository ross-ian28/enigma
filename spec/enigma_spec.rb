require './lib/enigma'
require 'RSpec'
RSpec.describe Enigma do
  before(:each) do
    enigma = Enigma.new
  end

  describe "exists" do
    expect(enigma).to be_a(Enigma)
  end
end

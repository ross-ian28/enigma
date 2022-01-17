require './lib/enigma'
require 'RSpec'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  describe "exists" do
    it "is an enigma" do
      expect(@enigma).to be_an(Enigma)
    end
    it "finds keys" do
      expect(@enigma.encrypt("Pabu is cool")).to eq([])
    end
  end
end

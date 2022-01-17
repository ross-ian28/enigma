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
      expect(@enigma.decrypt("Pabu is cool")).to eq({
        :encryption => #encrypted string,
        :key => "#{key}",
        :date => "#{date}"
      })
    end
  end
end

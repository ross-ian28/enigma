require './lib/enigma'
require 'RSpec'

RSpec.describe Enigma do
  before(:each) do
    @enigma = Enigma.new
  end

  it "is an enigma" do
    expect(@enigma).to be_an(Enigma)
  end
  it "encrypts message" do
    expect(@enigma.encrypt("!Pabu is cool")).to be_a(Hash)
  end
  xit "decrypts message" do
    expect(@enigma.decrypt("!Pabu is cool")).to be_a(Hash)
  end
end

# {
#   :encryption => #encrypted string,
#   :key => "#{key}",
#   :date => "#{date}"
# })

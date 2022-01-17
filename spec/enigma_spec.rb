require 'spec_helper'
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
    expect(@enigma.encrypt("Hello World!", "02715", "040895")).to eq({
      :encryption=>"keder ohulw!",
      :key=>"02715",
      :date=>"040895"
    })
  end
  it "decrypts message" do
    expect(@enigma.decrypt("keder ohulw!", "02715", "040895")).to eq({
      :encryption => "hello world!",
      :key => "02715",
      :date => "040895"
    })
  end
end

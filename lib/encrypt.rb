require './lib/enigma'

class Encrypt
  attr_reader :message, :newfile

  def initialize(message, new_file)
    @message = enigma.encrypt()
    @new_file = new_file
  end

  
end

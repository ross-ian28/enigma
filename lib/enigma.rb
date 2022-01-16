require 'date'
require 'pry'

class Enigma
  attr_reader :chars

  def initialize
    @chars = ("a".."z").to_a << " "
  end

  def encrypt(message, key = rand(9 ** 5), date = Date.today)
    key_arr = key.to_s.split("") #change integer into array of each character
    a_key = key_arr[0..1].join.to_i
    b_key = key_arr[1..2].join.to_i
    c_key = key_arr[2..3].join.to_i
    d_key = key_arr[3..4].join.to_i
    binding.pry
    #output =>
    #encryption:
    #key:
    #date:
  end

  def decrypt(ciphertext, key, date)

  end
end

require 'date'
require 'pry'

class Enigma
  attr_reader :chars

  def initialize
    @chars = ("a".."z").to_a << " "
  end

  def encrypt(message, key = rand(9 ** 5), date = rand(9 ** 6))
    key_arr = key.to_s.split("") #change integer into array of each character
    #creates the 4 keys
    a_key = key_arr[0..1].join.to_i
    b_key = key_arr[1..2].join.to_i
    c_key = key_arr[2..3].join.to_i
    d_key = key_arr[3..4].join.to_i

    date_squared = date ** 2
    offsets = date_squared.to_s.split("") #changes date into array of each element
    #creates the 4 offsets
    a_offset = offsets[-4].to_i
    b_offset = offsets[-3].to_i
    c_offset = offsets[-2].to_i
    d_offset = offsets[-1].to_i
    #adds the keys and offsets
    a_shift = (a_key + a_offset) % 26
    b_shift = (b_key + b_offset) % 26
    c_shift = (c_key + c_offset) % 26
    d_shift = (d_key + d_offset) % 26
    #downcase message
    message = message.downcase
    #iterate through message
    message_arr = message.split("")
    message_arr.each do |letter|
      if #shift is 0
        letter
      elsif

      end
      #shift method?
    end
    #return hash
    # return output = {
    #   :encryption => #encrypted string
    #   :key => "#{key}"
    #   :date => "#{date}"
    # }
  end

  def shift_foward

  end

  def shift_backwards

  end

  def decrypt(ciphertext, key, date)

  end
end

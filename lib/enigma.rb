require 'date'
require 'pry'
require 'simplecov'

class Enigma
  attr_reader :chars

  def initialize
    @chars = ("a".."z").to_a << " "
    @date = Date.today
  end

  def random_num
    rand(9 ** 5)
  end

  def finds_date
    @date.strftime("%m%d%y")
  end

  def encrypt(message, key = random_num, date = finds_date)
    key_arr = key.to_s.split("") #change integer into array of each character
    #creates the 4 keys
    a_key = key_arr[0..1].join.to_i
    b_key = key_arr[1..2].join.to_i
    c_key = key_arr[2..3].join.to_i
    d_key = key_arr[3..4].join.to_i


    date_squared = date.to_i ** 2 #squares date
    offsets = date_squared.to_s.split("") #changes date into array of each element
    #creates the 4 offsets
    a_offset = offsets[-4].to_i
    b_offset = offsets[-3].to_i
    c_offset = offsets[-2].to_i
    d_offset = offsets[-1].to_i

    #adds the keys and offsets
    a_shift = (a_key + a_offset)
    b_shift = (b_key + b_offset)
    c_shift = (c_key + c_offset)
    d_shift = (d_key + d_offset)

    #downcase message and change into array
    message = message.downcase
    message_arr = message.split("")

    #iterate through message array
    encrypted_message = []
    message_arr.each_with_index do |letter, index|
      binding.pry
      if letter == "\n"
        delete(letter)
      elsif @chars.include?(letter) == false #ignore anything not a letter or space
        encrypted_message << letter
      elsif index % 4 == 0
        new_letter = @chars.rotate(a_shift)[@chars.index(letter)]
        encrypted_message << new_letter
      elsif index % 4 == 1
        new_letter = @chars.rotate(b_shift)[@chars.index(letter)]
        encrypted_message << new_letter
      elsif index % 4 == 2
        new_letter = @chars.rotate(c_shift)[@chars.index(letter)]
        encrypted_message << new_letter
      elsif index % 4 == 3
        new_letter = @chars.rotate(d_shift)[@chars.index(letter)]
        encrypted_message << new_letter
      end
    end

    #Change message array to string
    new_encrypted_message = encrypted_message.join.to_s

    #return hash
    return output = {
      :encryption => "#{new_encrypted_message}",
      :key => "#{key}",
      :date => "#{date}"
    }
  end


  def decrypt(ciphertext, key, date)
    key_arr = key.split("") #change into array of each character

    #change chipertext into an array
    ciphertext_arr = ciphertext.split("")

    #creates the 4 keys
    a_key = key_arr[0..1].join.to_i
    b_key = key_arr[1..2].join.to_i
    c_key = key_arr[2..3].join.to_i
    d_key = key_arr[3..4].join.to_i

    date_squared = date.to_i ** 2
    offsets = date_squared.to_s.split("") #changes date into array of each element
    #creates the 4 offsets
    a_offset = offsets[-4].to_i
    b_offset = offsets[-3].to_i
    c_offset = offsets[-2].to_i
    d_offset = offsets[-1].to_i
    #adds the keys and offsets
    a_shift = (a_key + a_offset)
    b_shift = (b_key + b_offset)
    c_shift = (c_key + c_offset)
    d_shift = (d_key + d_offset)
    #iterate through cipgertext array
    decrypted_message = []
    ciphertext_arr.each_with_index do |letter, index|
      if @chars.include?(letter) == false #ignore anything not a letter or space
        decrypted_message << letter
      elsif index % 4 == 0
        new_letter = @chars.rotate(a_shift * -1)[@chars.index(letter)]
        decrypted_message << new_letter
      elsif index % 4 == 1
        new_letter = @chars.rotate(b_shift * -1)[@chars.index(letter)]
        decrypted_message << new_letter
      elsif index % 4 == 2
        new_letter = @chars.rotate(c_shift * -1)[@chars.index(letter)]
        decrypted_message << new_letter
      elsif index % 4 == 3
        new_letter = @chars.rotate(d_shift * -1)[@chars.index(letter)]
        decrypted_message << new_letter
      end
    end

    #Change ciphertext back to string
    new_decrypted_ciphertext = decrypted_message.join.to_s

    #return hash
    return output = {
      :encryption => "#{new_decrypted_ciphertext}",
      :key => "#{key}",
      :date => "#{date}"
    }
  end
end

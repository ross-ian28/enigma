require './lib/enigma'

@enigma = Enigma.new

message = ARGV[0]
new_file = ARGV[1]

user_message = File.new(message).read
enigma_hash = @enigma.encrypt(user_message)

File.open(new_file, "w") do |file|
  file.puts enigma_hash[:encryption]
  puts "Created #{new_file} with the key #{enigma_hash[:key]}, and date #{hash_output[:date]}"
end

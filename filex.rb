#ruby program to simplify the file exange between two mechines

file = ARGV[0]
name = ARGV[1]

if name == "devop"
  destination = "devop@192.168.24.249:/home/devop/"
end
cmd = "scp #{file} #{destination}"
exec( cmd )
puts "file transmited" 


#ruby program to simplify the file exange between two mechine

while true
  puts "1 Register"
  puts "2 File Transfer"
  puts "3 Quit"
  option = gets.chomp
  case option
    when "1"
      puts "Enter user name"
      uname = gets.chomp
      puts "Enter machine name"
      machine = gets.chomp
      puts "Enter IP"
      ip = gets.chomp
      aFile = File.new("Register.txt", "a+")
      aFile.puts uname+":"+machine+":"+ip
      aFile.close
    when "2"
      puts "Enter user name"
      uname = gets.chomp
      puts "Enter machine name"
      machine = gets.chomp
      puts "Enter file"
      file = gets.chomp
      IO.foreach("Register.txt") { |line|
        split_array = line.chomp.split(":")
        if uname == split_array[0]
          if machine == split_array[1]
            puts split_array[0], split_array[1]
            destination = split_array[0]+'@'+split_array[2]+':/home/'+split_array[0]+'/'
            puts destination
            cmd = "scp #{file} #{destination}"
            exec( cmd )
	  end
        end
	}
    when "3"
      exit
    else
       puts "Enter valid option"
  end
end

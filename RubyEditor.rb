looping = true
what_to_do = ""
file_name = ""
write_to_file = ""
row = ""
column = ""

def path()
  puts "Whats the path to the file?"
  print ">"

  file_name = gets().chomp()
end

while looping
  puts "Do you want to read a file, then press : 1"
  puts "Do you want to overwrite a file, then press : 2"
  puts "Do you want to overwrite a file from the cursor position, then press : 3"
  puts "Do you want to append to a file, then press : 4"
  print ">"

  what_to_do = gets().chomp()

  if what_to_do == "1"
    path()

  begin
    File.open(file_name, "r") do |file|

      puts "Beggining of the file >"
      puts ""
      puts file.read()
      puts ""
      puts "Ending of the file >"
      puts ""

    end

  rescue Errno::ENOENT
    puts "ERROR! File does not exist!"
  rescue Errno::EINVAL
    puts "ERROR! Filename has illegal characters in it!"
  end

  elsif what_to_do == "2"
    path()

    begin
      File.open(file_name, "w") do |file|

        puts "What do you want the content of the file to be overwridden with?"
        print ">"

        write_to_file = gets()

        file.write(write_to_file)
        puts "File overwridden!"

      end
  
    rescue Errno::ENOENT
      puts "ERROR! File does not exist!"
    rescue Errno::EINVAL
      puts "ERROR! Filename has illegal characters in it!"
    end

  elsif what_to_do == "3"
    path()

    begin
      File.open(file_name, "r+") do |file|

        puts "In which row do you want the cursor to be?"
        print ">"

        row = gets().chomp().to_i()
        row -= 1

        row.times do
          file.readline()
        end

        puts "In which column do you want the cursor to be?"
        print ">"

        column = gets().chomp().to_i()
        column -= 1

        column.times do
          file.readchar()
        end

        puts "What do you want the content after the cursor position to be overwridden with?"
        print ">"

        write_to_file = gets()

        file.write(write_to_file)
        puts "Content after cursor position overwridden!"

      end
  
    rescue Errno::ENOENT
      puts "ERROR! File does not exist!"
    rescue Errno::EINVAL
      puts "ERROR! Filename has illegal characters in it!"
    end

  elsif what_to_do == "4"
    path()

    begin
      File.open(file_name, "a") do |file|

        puts "What do you want to append to the file?"
        print ">"

        write_to_file = gets()

        file.write(write_to_file)
        puts "Text appended!"
  
      end

    rescue Errno::ENOENT
      puts "ERROR! File does not exist!"
    rescue Errno::EINVAL
      puts "ERROR! Filename has illegal characters in it!"
    end

  else
    puts (what_to_do + " is not a valid option!")
  end
end

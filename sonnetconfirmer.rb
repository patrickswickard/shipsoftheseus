require 'dictparse.rb'

def checksonnet(lines)
  puts "What scheme, Shakespeare or Browning?"
  puts "1.  Shakespeare"
  puts "2.  Browning"
  blah = gets.chomp
  if blah == "1"
    puts "Parsing like Shakespeare"
  elsif blah == "2"
    puts "Parsing like Browning"
  else
    puts "Parsing like Shakespeare"
    blah = "1"
  end
  puts "#{lines.size} lines detected"

  unless lines.size == 14
    puts "ERROR: Absolutely not, buddy, a sonnet has exactly 14 lines"
  end

  puts "*****************************************"

  lines.each do |thisline|
    puts thisline
    puts "Does it scan?"
    gets
  end

  puts "***********************"
  puts "Now let's check the rhyme scheme..."
  puts "***********************"
  if blah == "1"
    puts lines[0]
    puts lines[2]
    puts "Do they rhyme?"
    gets
    puts lines[1]
    puts lines[3]
    puts "Do they rhyme?"
    gets
    puts lines[4]
    puts lines[6]
    puts "Do they rhyme?"
    gets
    puts lines[5]
    puts lines[7]
    puts "Do they rhyme?"
    gets
    puts lines[8]
    puts lines[10]
    puts "Do they rhyme?"
    gets
    puts lines[9]
    puts lines[11]
    puts "Do they rhyme?"
    gets
    puts lines[12]
    puts lines[13]
    puts "Do they rhyme?"
    gets
  else
    puts lines[0]
    puts lines[3]
    puts "Do they rhyme?"
    gets
    puts lines[1]
    puts lines[2]
    puts "Do they rhyme?"
    gets
    puts lines[4]
    puts lines[7]
    puts "Do they rhyme?"
    gets
    puts lines[5]
    puts lines[6]
    puts "Do they rhyme?"
    gets
    puts lines[8]
    puts lines[10]
    puts lines[12]
    puts "Do they rhyme?"
    gets
    puts lines[9]
    puts lines[11]
    puts lines[13]
    puts "Do they rhyme?"
    gets
  end
  puts "***********************"
  puts "If you answered yes to all of these then you got yourself a sonnet!"
  puts "***********************"
end

#puts "Checking sonnet 1"
#a = File.open("candsonnetbad.txt")
#lines = a.readlines
#checksonnet(lines)
#gets
#puts "Checking sonnet 2"
#a = File.open("candsonnetgood.txt")
#lines = a.readlines
#checksonnet(lines)
#gets

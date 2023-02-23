require 'json'

a = File.read('user_sonnetshake_mod.json')
b = File.read('user_randorder.json')

@all_sonnets = JSON.parse(a)
@all_rand = JSON.parse(b)

@all_sonnets.each do |this_sonnet|
  this_sonnet.each do |this_line_pair|
    original_line = this_line_pair[0]
    new_line = this_line_pair[1]
    #puts original_line
  end
end

def print_line(sonnet,line)
  puts "Original:\n"
  puts "#{@all_sonnets[sonnet][line][0]}"
  puts "New:\n"
  puts "#{@all_sonnets[sonnet][line][1]}"
end

def print_randline()
  sonnet = rand(153)
  line = rand(13)
  puts "Random line Sonnet #{sonnet} line #{line}"
  print_line(sonnet,line)
  puts "Whole sonnet: #{print_sonnet(sonnet)}"
end

def print_sonnet(sonnet_number)
  sonnet = @all_sonnets[sonnet_number]
  sonnet.each do |thisline|
    if thisline[1].to_s.empty?
      puts thisline[0]
    else
      puts "** #{thisline[1]}"
    end
  end
end

#this_sonnet = @all_sonnets[rand(153)]
#print_sonnet(this_sonnet)


def replace_missing_line(sonnet_number,line_number)
  puts "**************************************"
  puts "What do you want to replace this with?  Iambic pentameter and rhyme, please..."
  puts "**************************************"
  newline = gets.chomp
  if newline.to_s.empty?
    puts "Empty line detected.  Exiting with no changes."
    return nil
  end
  puts newline 
  @all_sonnets[sonnet_number][line_number][1] = newline
  outfile = File.open("sonnetshake_mod.json","w")
  outfile.write(@all_sonnets.to_json)
  outfile.close
  puts "**************************************"
  puts "Sonnet #{sonnet_number} Line #{line_number} has been replaced!"
end

def print_sonnet_missing_line(sonnet_number,line_number)
  sonnet = @all_sonnets[sonnet_number]
  current_line = 0
  sonnet.each do |thisline|
    if current_line == line_number
      if thisline[1].to_s.empty?
        print "___________________________\n"
      else
        raise "ERROR this one has already been done WTF!!!\n"
      end
    else
      if thisline[1].to_s.empty?
        print "#{thisline[0]}\n"
      else
        print "** #{thisline[1]}\n"
      end
    end
    current_line += 1
  end
end

def swap_line(sonnet_number,line_number)
  puts "this needs to be done"
  puts "The story so far..."
  sonnet = @all_sonnets[sonnet_number]
  puts "You'll be replacing sonnet #{sonnet_number} line #{line_number} (indexed on zero)"
  puts "**************************************"
  print_sonnet_missing_line(sonnet_number, line_number)
  replace_missing_line(sonnet_number,line_number)
end

def swap_next()
  puts "SHAKESPEARE PLAGIARISM PROJECT - CHAPTER TWO\n"
  puts "\n"
  puts "The sun's a thief, and with his great attraction\n"
  puts "Robs the vast sea; the moon's an arrant thief,\n"
  puts "And her pale fire she snatches from the sun.\n"
  puts "The sea's a thief, whose liquid surge resolves\n"
  puts "The moon into salt tears; the earth's a thief\n"
  puts "That feeds and breeds by a composture stol'n\n"
  puts "From general excrement: each thing's a thief:\n"
  puts "The laws, your curb and whip, in their rough power\n"
  puts "Have uncheck'd theft.\n"
  puts "\n"
  puts "Timon of Athens, Act IV Scene III"
  puts "\n"
  puts "Press enter to continue..."
  gets
  counter = 0
  @all_rand.each do |thispair|
    counter += 1
    print "Examining random line #{counter} of 2156\n"
    sonnet_number = thispair[0]
    line_number = thispair[1]
    #puts sonnet_number
    #puts sonnet_line
    if @all_sonnets[sonnet_number][line_number][1].to_s.empty?
      swap_line(sonnet_number,line_number)
      break
    else
      puts "this is already done"
    end
  end
end

swap_next()

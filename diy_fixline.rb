require 'json'

a = File.read('diy_sonnetshake_mod.json')
b = File.read('diy_randorder.json')

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
  outfile = File.open("diy_sonnetshake_mod.json","w")
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

def fix_line(sonnet_number,line_number)
  sonnet = @all_sonnets[sonnet_number]
  puts "You'll be replacing sonnet #{sonnet_number} line #{line_number} (indexed on zero)"
  puts "**************************************"
  print_sonnet_missing_line(sonnet_number, line_number)
  replace_missing_line(sonnet_number,line_number)
end

def prompt_fix()
  puts "SHAKESPEARE META-PLAGIARISM PROJECT - CHAPTER YOU\n"
  puts "DIY EDITION\n"
  puts "\n"
  print "O hateful error, melancholy's child,\n"
  print "Why dost thou show to the apt thoughts of men\n"
  print  "The things that are not?\n"
  puts "\n"
  puts "Julius Caesar, Act V Scene III"
  puts "\n"
  gets
  puts "which sonnet do you wish to fix (indexed on zero): "
  sonnet_to_fix = gets.chomp
  if sonnet_to_fix.to_s.empty?
    puts "No input detected.  Exiting with no changes."
    return nil
  end
  puts "which line do you wish to fix (indexed on zero): "
  line_to_fix = gets.chomp
  if line_to_fix.to_s.empty?
    puts "No input detected.  Exiting with no changes."
    return nil
  end
  print "Fixing sonnet #{sonnet_to_fix.to_i} line #{line_to_fix.to_i}...\n"
  fix_line(sonnet_to_fix.to_i,line_to_fix.to_i)
end

prompt_fix()

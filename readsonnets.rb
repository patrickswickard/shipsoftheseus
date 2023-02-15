require 'json'

a = File.read('sonnetshake_mod.json')

@all_sonnets = JSON.parse(a)

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

def print_sonnet(sonnet)
  sonnet.each do |thisline|
    if thisline[1].to_s.empty?
      puts thisline[0]
    else
      puts "** thisline[1]"
    end
  end
end

#this_sonnet = @all_sonnets[rand(153)]
#print_sonnet(this_sonnet)

def swap_line(sonnet,line)
end

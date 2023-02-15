require 'json'
require 'set'

a = File.read('sonnetshake_mod.json')
b = File.read('randorder.json')

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

def print_sonnet(sonnet_number, replace_lines_int)
  lines_to_replace = Set[]
  @all_rand[0..replace_lines_int].each do |thispair|
    if thispair[0] == sonnet_number
      lines_to_replace.add(thispair[1])
    end
  end
  #puts lines_to_replace.inspect
  sonnet = @all_sonnets[sonnet_number]
  curline = 0
  sonnet.each do |thisline|
    if thisline[1].to_s.empty?
      puts thisline[0]
    else
      if lines_to_replace.include? curline
        puts "** #{thisline[1]}"
      else
        puts "#{thisline[0]}"
      end
    end
    curline += 1 
  end
end


def print_on_demand(sonnet_number, replace_lines_int)
  print_sonnet(sonnet_number, replace_lines_int)
end

puts "First sonnet: "
first_sonnet = gets.chomp
if first_sonnet.to_s.empty?
  puts "Using 1"
  first_sonnet = '1'
end
puts "Last sonnet: "
last_sonnet = gets.chomp
if last_sonnet.to_s.empty?
  puts "Using 154"
  last_sonnet = '154'
end
puts "How many lines to replace (0 for all Shakespeare, 2156 for all new)"
replace_lines = gets.chomp
if replace_lines.to_s.empty?
  puts "Using 0 (all Shakespeare)"
  replace_lines = '0'
end

first_index = first_sonnet.to_i - 1
last_index = last_sonnet.to_i - 1
replace_lines_int = replace_lines.to_i
for i in (first_index..last_index)
#for i in (75..75)
#for i in (0..20)
  puts "SONNET #{i+1}\n\n"
  sonnet_number = i
  print_on_demand(sonnet_number, replace_lines_int)
  puts "\n*****************\n"
end

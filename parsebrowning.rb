require 'sonnetconfirmer.rb'

a = File.open("sonnetport_mod.txt")

linecount = 0
sonnet_list = []
this_sonnet = []
a.lines.each do |thisline|
  if thisline =~ %r{(?m)^w+}
#    puts "NEW SONNET"
    this_sonnet = []
  elsif thisline =~ %r{(?m)^\s+\S}
#    puts "LINE"
    linecount = linecount + 1
    puts linecount
    this_sonnet.push(thisline.strip)
  elsif thisline =~ %r{(?m)^\s*$}
#    puts "BLANKLINE"
    linecount = 0
    sonnet_list.push(this_sonnet) unless this_sonnet.empty?
    this_sonnet = []
  end    
end

sonnet_count = 0
sonnet_list.each do |this_sonnet|
  sonnet_count = sonnet_count + 1
  puts "Sonnet #{sonnet_count}"
  this_sonnet.each do |thisline|
#    puts thisline
  end
#  puts "\n"
#  puts "****************************\n"
#  puts "\n"
end

sonnet_list.each do |this_sonnet|
  checksonnet(this_sonnet)
end

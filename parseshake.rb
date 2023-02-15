require 'sonnetconfirmer.rb'
require 'json'


def reset_all_sonnets()
  a = File.open("sonnetshake_mod.txt")
  linecount = 0
  sonnet_list = []
  this_sonnet = []
  a.lines.each do |thisline|
    puts thisline
    if thisline =~ %r{(?m)^SONNET\s+\d+}
      puts "NEW SONNET"
      this_sonnet = []
    elsif thisline =~ %r{(?m)^\s*O$}
      puts "ZERO"
      linecount = 0
      sonnet_list.push(this_sonnet) unless this_sonnet.empty?
      this_sonnet = []
    elsif thisline =~ %r{(?m)^\s*\S}
      puts "LINE"
      linecount = linecount + 1
      puts linecount
      this_sonnet.push([thisline.strip,''])
    elsif thisline =~ %r{(?m)^\s*$}
      puts "BLANKLINE"
    end
  end
  outfile = File.open("sonnetshake_mod.json","w")
  outfile.write(sonnet_list.to_json)
  outfile.close
  sonnet_count = 0
  sonnet_list.each do |this_sonnet|
    sonnet_count = sonnet_count + 1
    puts "Sonnet #{sonnet_count}"
    this_sonnet.each do |thisline|
    end
  end
end

#reset_all_sonnets()


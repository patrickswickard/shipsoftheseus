# hello world
#

def gen_dict_hash()
  a = File.open("cmudict_mod.txt")

  dict_hash = {}

  a.lines.each do |thisline|
    begin
      tokenlist = thisline.split(/\s+/)
      thisword = tokenlist[0]
      rest = tokenlist[1..-1]
      dict_hash[thisword] = rest
    rescue
      next
    end
  end
  return dict_hash
end

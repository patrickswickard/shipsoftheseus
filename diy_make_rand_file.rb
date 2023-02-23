#require 'sonnetconfirmer.rb'
require 'json'

MAX_SONNETS = 154
MAX_LINES = 14


def reset_rand()
  a = File.open("randorder.json", 'w')
  all_list = []
  for i in (0..MAX_SONNETS-1)
    for j in (0..MAX_LINES-1)
      all_list.push([i,j])
    end
  end
  all_list = all_list.shuffle
  a.write(all_list.to_json)
  a.close
end

#reset_rand()

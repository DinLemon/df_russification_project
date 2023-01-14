matches = {}
File.foreach('associations.txt') do |a|
  split = a.split('|')
  key = split[1].strip!
  matches[key] = split[0]
end

# puts matches.inspect

File.foreach("credits.new.txt") do |line| 
  word_arr = []
  line.split('').each do |char|
    if char != ' '
      if matches[char]
        word_arr.push(matches[char])
      else
        word_arr.push(char)
      end
    else
    word_arr.push(char)
    end
  end
  puts word_arr.join('')
end

# TODO: iconv 
# TOD: move to vanilla folder

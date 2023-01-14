
if !ARGV[0] then
  puts "Usage: ruby ./decoder.rb %PATH_TO_RUSSIAN_FILE%"
  exit!
end

selected_file = ARGV[0]
path_arr = selected_file.split('/')
file_name = path_arr.last
selected_path = selected_file.gsub(file_name, '').gsub('_en', '')
system("mkdir -p #{selected_path}")

matches = {}
File.foreach('associations.txt') do |a|
  split = a.split('|')
  key = split[1].strip!
  matches[key] = split[0]
end

full_arr = []
File.foreach(selected_file) do |line| 
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
  line_out = word_arr.join('').strip!
  # puts line_out

  full_arr.push(line_out)
end

output_file = selected_file.gsub('_en', '')
content = full_arr.join("\n")

File.write(output_file, content)
system("iconv -f UTF-8 -t CP437 #{output_file} -o #{output_file}.tmp -c")
system("mv #{output_file}.tmp #{output_file}")

#
# # TODO: iconv 
# # TOD: move to vanilla folder

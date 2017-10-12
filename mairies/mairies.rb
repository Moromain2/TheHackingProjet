require 'rubygems'
require 'nokogiri'
require 'open-uri'

puts "EMAILS OF VAUREAL TOWNHALL \n"
#Get emails of vaureal townhall
mairie_vaureal = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/vaureal.html"))
mairie_vaureal.css('p:contains("@")').each do |node|
  puts node.text
end

puts "\n \nALL URLS TOWNHALLS\n"
#Get URLs of all townhalls
def get_all_the_urls_of_val_doise_townhalls()
  mairies_val_d_oise = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))

  links = mairies_val_d_oise.css('a.lientxt')
  links.each{ |link| puts link.content + " :\n" "http://annuaire-des-mairies.com/" + link["href"] + "\n\n"}
end
puts get_all_the_urls_of_val_doise_townhalls()

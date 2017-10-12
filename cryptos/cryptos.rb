require 'rubygems'
require 'nokogiri'
require 'open-uri'


#list of cryptocurrencies
cryptos = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
cryptos.css('td.no-wrap.currency-name').each do |currency|
  puts currency.text
end

#list of values
values = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
values.css('a.price').each do |value|
  puts value.text
end

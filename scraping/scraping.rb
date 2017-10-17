=begin
require 'google_drive'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
VAL_DOISE_URL = "https://twitter.com/cmemertens/followers"

session = GoogleDrive::Session.from_config("config.json")
#Aller sur spreadsheet / creer un nouveau document / récuperer l'url du document comme ci-dessous
#https://docs.google.com/spreadsheets/d/1YVTdR_1vf3SgNWc5VdvtMqvukRimFcOIc-a_UgY-Igk/edit?usp=sharing
#Copier la clé
#https://docs.google.com/spreadsheets/d/[CLE A COPIER]/edit?usp=sharing
#Coller la clé
$worksheet = session.spreadsheet_by_key("1HOLp5lbpqlbH0oY0JEaljbvvRyWsBHc8BudatUPwOFU").worksheets[0]

def set_worksheet
	$worksheet[1, 1] = "Ville"
	$worksheet[1, 2] = "Adresse email"
	$worksheet.save
end

set_worksheet

def get_the_email_of_a_townhal_from_its_webpage(url)
	page = Nokogiri::HTML(open(url))
	email = page.xpath('//table/tr[3]/td/table/tr[1]/td[1]/table[4]/tr[2]/td/table/tr[4]/td[2]/p/font')
	#puts email.text
	email.text
end

def get_all_the_urls_of_val_doise_townhalls(url)
	towns_mail_list = Hash.new()
	page = Nokogiri::HTML(open(url))
	page.xpath('//table/tr[2]/td/table/tr/td/p/a').each do |town|
		town_name = town.text.downcase
		proper_town_name = town_name.capitalize
		town_name = town_name.split(' ').join('-')
		url = "http://annuaire-des-mairies.com/95/#{town_name}.html"
		towns_mail_list[proper_town_name.to_sym] = get_the_email_of_a_townhal_from_its_webpage(url)
	end
	counter = 2
	towns_mail_list.each do |key, value|
		$worksheet[counter, 1] = key
		$worksheet[counter, 2] = value
		counter += 1
		$worksheet.save
	end

end



get_all_the_urls_of_val_doise_townhalls(VAL_DOISE_URL)

============

require 'google_drive'
require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'watir'
browser = Watir::Browser.new(:chrome)
browser.goto 'https://www.facebook.com/groups/moilibertin/members/'

signIn={
 email: "romain.mosser@hotmail.fr", # The email you use to sign in to Facebook
 password: "Moromain24121994paris" # The password you use to sign in to Facebook
 }

 browser.text_field(:id, "email").set signIn[:email]
browser.text_field(:id, "pass").set signIn[:password]
browser.button(:type,"submit").click


FACEBOOK_URL = "https://www.facebook.com/groups/moilibertin/members/"

session = GoogleDrive::Session.from_config("config.json")
#Aller sur spreadsheet / creer un nouveau document / récuperer l'url du document comme ci-dessous
#https://docs.google.com/spreadsheets/d/1YVTdR_1vf3SgNWc5VdvtMqvukRimFcOIc-a_UgY-Igk/edit?usp=sharing
#Copier la clé
#https://docs.google.com/spreadsheets/d/[CLE A COPIER]/edit?usp=sharing
#Coller la clé
$worksheet = session.spreadsheet_by_key("1D2F4o7ViurhRg3oXsFOyDeccvrg1-l8MrSpVno6oqX8").worksheets[0]

def set_worksheet
	$worksheet[1, 1] = "Nom"
	$worksheet[1, 2] = "Url Profile"
	$worksheet.save
end

set_worksheet

def get_name_of_users(url)
	page = Nokogiri::HTML(open(url))
	name = page.xpath('//p[@class="foo"]/a:content') #//*[@id="member_100022432807804"]/div/div/div[2]/div[1]/a:content')
	puts name.text
	name.text
end

def get_url_of_users(url)
	name = Hash.new()
	page = Nokogiri::HTML(open(url))
	page.xpath('//table/tr[2]/td/table/tr/td/p/a').each do |url|
	url.text
	end
	counter = 2

name.each do |key, value|
		$worksheet[counter, 1] = key
		$worksheet[counter, 2] = value
		counter += 1
		$worksheet.save
	end

end



get_url_of_users(FACEBOOK_URL)
=end

require 'watir'
require 'pry'

class FacebookScrapper

  attr_accessor :browser

  def initialize
	# open a firefox browser
	@browser = Watir::Browser.new(:firefox)
  end

  # log into Facebook
  def login

	@browser.goto "https://www.facebook.com"

	@browser.text_field(id: 'email').set("romain.mosser@hotmail.fr")
	@browser.text_field(id: 'pass').set('Moromain24121994paris')

	@browser.text_field(id: 'pass').send_keys(:enter)

  end

  # click on see more to see all members
  def display_members(url_members)

	@browser.driver.manage.timeouts.implicit_wait = 5

	@browser.goto(url_members)

	while true
   	begin
    	link_see_more = @browser.element(:xpath => "//a[@class='pam uiBoxLightblue uiMorePagerPrimary']").wait_until_present
    	link_see_more.click
  	rescue Watir::Exception::UnknownObjectException, Watir::Wait::TimeoutError
    	break
  	end
	end

  end

  # display all members shown on a group members page
  def get_members
	@browser.elements(:xpath => "//div[@class='fsl fwb fcb']/a").each do |member|
  	puts member.text
	end
  end

	def get_urls
    search_result = browser.divs(class: "fsl fwb fcb")
  	search_result.each { |div| p div.a.text + " - " + div.a.href}
    	puts search_result.text
	end

  def close
	@browser.close
  end
end

fbScrapper = FacebookScrapper.new
fbScrapper.login
sleep(5)
fbScrapper.display_members("https://www.facebook.com/groups/1081312131978634/members/")
fbScrapper.get_members
fbScrapper.get_urls
fbScrapper.close

require 'watir'
browser = Watir::Browser.new(:firefox)
browser.goto 'google.com'

search_bar = browser.text_field(class: 'gsfi')

search_bar.set("Voiture")

search_bar.send_keys(:enter)

browser.driver.manage.timeouts.implicit_wait = 6

search_results_div = browser.divs(class:"rc")
search_results_div.each { |div| p div.h3.text}

p "recherche terminée"
browser.close

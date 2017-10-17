require 'google_drive'
require 'pry'
require 'json'
require 'csv'
require 'gmail'

Gmail.connect('thp.romain@gmail.com', 'THPnumaParis02!') do |gmail|
end

Gmail.connect('thp.romain@gmail.com', 'THPnumaParis02!') do |gmail|
  puts gmail.logged_in?
end

session = GoogleDrive::Session.from_service_account_key("client_secret.json")
spreadsheet = session.spreadsheet_by_key("1Z879Gx7ji6xEJulFMkjJ8YH_uWyT92ifwf7yJ2KGXvQ")
worksheet = spreadsheet.worksheets.first


def get_the_email_html (c_name)
  html_part do
    content_type 'text/html; charset=UTF-8'
    body "<p>Bonjour,</p>
  		<p>J'habite #{c_name} et me permets de vous contacter pour vous faire part d'une nouvelle formation que je suis en train de suivre.</p>
  		<p><a href='http://thehackingproject.org'>The Hacking Project</a> est une formation au code gratuite, ouverte à tous, d'une durée de 3 mois.<br>
  		L'objectif de cette formation est de développer un socle de connaissances solides pour décrocher un CDI de développeur web junior.</p>
  		<p>Cette formation pourrait intéresser un grand nombre de jeunes étudiants ou actifs confirmés. N'hésitez pas à mentionner ce projet aux associations de la ville.<br>
  		Nous travaillons par petits groupes de 6 à 8 élèves, et sommes également très intéressés par la mise à disposition d'un local, si nous arrivons à former un groupe à #{c_name} pour les prochaines sessions.</p>
  		<p>N'hésitez pas à contacter Charles, co-fondateur du projet au 06 95 46 60 80.</p>
  		<p>Bien cordialement,<br>
  		Romain M<br>
  		<a href='mailto:thp.romain@gmail.com'>thp.romain@gmail.com</a></p>"
      subject = "Formation au code à #{c_name}"
  end
  binding.pry
    return [content, subject]

end


def send_email_to_line(sheet, line)
  city_name = sheet[line,1]
  city_email = sheet[line, 2]
  puts city_name
  puts city_email

  email_cont_sub = get_the_email_html(city_name)
	email_content = email_cont_sub[0]
	email_subject = email_cont_sub[1]

  gmail = Gmail.connect($id_var[0], $id_var[1])
	puts gmail.logged_in?

  gmail.deliver do
	  to city_email
	  cci 'thp.romain@gmail.com'
	  subject email_subject
	  html_part do
    	content_type 'text/html; charset=UTF-8'
      body email_content
  	  end
  	  puts "mail sent to #{city_email}"
	end

  gmail.logout

end

begin
def go_through_all_the_lines(sheet)

  for i in (2..sheet.num_rows)
    send_email_to_line(sheet,i)
  end
end

  go_through_all_the_lines(worksheet)
end

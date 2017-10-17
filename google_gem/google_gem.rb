require 'gmail'

gmail = Gmail.connect('thp.romain@gmail.com', 'THPnumaParis02!')

gmail.deliver do
  to "mosser.romain@gmail.com"
  subject "Having fun in Puerto Rico!"
  html_part do
    content_type 'text/html; charset=UTF-8'
    body "<p>Nullam quis risus eget urna mollis ornare vel eu leo. Etiam porta sem malesuada magna mollis euismod. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Maecenas faucibus mollis interdum. Morbi leo risus, porta ac consectetur ac, vestibulum at eros</p>"
  end
end

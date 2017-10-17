require 'bundler'
Bundler.require

# Authenticate a session with your Service Account
session = GoogleDrive::Session.from_service_account_key("client_secret.json")

# Get the spreadsheet by its title
spreadsheet = session.spreadsheet_by_title("Legislators")
# Get the first worksheet
worksheet = spreadsheet.worksheets.first
# Print out the first 6 columns of each row
worksheet.rows.each { |row| puts row.first(7).join(" | ") }
worksheet.delete_rows(2, 1)
worksheet.save

# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {

  address: 'smtp.sendgrid.net',

  port: '587',

  authentication: :plain,

  user_name: ENV['SENDGRID_USERNAME'].to_s,

  password: ENV['SENDGRID_PASSWORD'].to_s,

  domain: 'heroku.com',

  enable_starttls_auto: true

}

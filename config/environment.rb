# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {

  address: 'smtp.sendgrid.net',

  port: '587',

  authentication: :plain,

  user_name: 'app238636950@heroku.com',

  password: 'zelf0jne5329',

  domain: 'heroku.com',

  enable_starttls_auto: true

}
ActionMailer::Base.delivery_method = :smtp

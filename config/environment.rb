# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!
ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',

  port: '465',

  user_name: 'apikey',

  password: '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',
}
ActionMailer::Base.delivery_method = :smtp

if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => "app19982038@heroku.com",
    :password       => "jpdv1cr2",
    :domain         => 'heroku.com',
    :enable_starttls_auto => true
  }
end
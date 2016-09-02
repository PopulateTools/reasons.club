ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
  :access_key_id     => Rails.application.secrets.amazon_access_key,
  :secret_access_key => Rails.application.secrets.amazon_secret_key,
  :server => 'email.eu-west-1.amazonaws.com'

ActionMailer::Base.smtp_settings = { 
  :address              => 'smtp.gmail.com',
  :port                 => 587,
  :domain               => 'gmail.com',
  :user_name            => 'jothiswaran92@gmail.com',
  :password             => 'borntoachieve',
  :authentication       => :plain,
  :enable_starttls_auto => true,
} 
class Notifier < ActionMailer::Base
  
def signup_notification(recipient)
     recipients recipient.email
     bcc        ["railsruby670@gmail.com"]
     from       "railsruby670@gmail.com"
     subject    "New account information"
     body       :account => recipient
 end

def renewalmail(recipient)
	recipient.each do |to|
	 	recipients to.email
     	bcc        ["railsruby670@gmail.com"]
     	from       "railsruby670@gmail.com"
     	subject    "New account information"
     	content_type "text/html"
     	body       :book => to.books
    end
end

end

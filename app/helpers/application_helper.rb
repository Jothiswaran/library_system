# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def avatar_url(user)
		puts user.email
default_url = "public/images/logo.png"
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
    end
end

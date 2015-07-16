module EmailHelper
	def substitute_name(text, user)
		text.gsub! "$FIRSTNAME$", user.first_name
		text.gsub! "$LASTNAME$", user.last_name
		text.gsub! "$FULLNAME$", user.name
		return text
	end
end

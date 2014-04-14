class UserTable < BaseTable

	def attributes(element)
		[
			element.id,
			element.name,
			element.remember_token,
			element.password_digest,
			element.level,
			h.l(element.created_at, format: :short),
			h.l(element.updated_at, format: :short)
		]
	end

	def url(element)
		element.id
	end

	def model
		User
	end

end
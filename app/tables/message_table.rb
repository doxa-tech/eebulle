class MessageTable < BaseTable

	def attributes(element)
		[
			element.id,
			element.name,
			element.file_url,
			h.l(element.date, format: :short),
			element.speaker,
			h.l(element.created_at, format: :short),
			h.l(element.updated_at, format: :short)
		]
	end

	def url(element)
		element.id
	end

	def model
		Message
	end

end
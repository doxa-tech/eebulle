class EventTable < BaseTable

	def attributes(element)
		[
			element.id,
			element.name,
			element.content,
			element.duration,
			h.l(element.date, format: :short),
			h.l(element.created_at, format: :short),
			h.l(element.updated_at, format: :short)
		]
	end

	def url(element)
		element.id
	end

	def model
		Event
	end

end
class ActivityTable < BaseTable

	def attributes(element)
		[
			element.id,
			element.name,
			element.content,
			h.l(element.time, format: :short_time),
			element.main,
			element.recurrence.name,
			h.l(element.created_at, format: :short),
			h.l(element.updated_at, format: :short)
		]
	end

	def url(element)
		element.id
	end

	def model
		Activity
	end

end
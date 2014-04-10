class PageTable < BaseTable

	def attributes(element)
		[
			element.id,
			element.content,
			element.name,
			h.l(element.created_at, format: :short),
			h.l(element.updated_at, format: :short)
		]
	end

	def url(element)
		element.id
	end

	def model
		Page
	end

end
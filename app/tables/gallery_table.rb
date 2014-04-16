class GalleryTable < BaseTable

	def attributes(element)
		[
			element.id,
			element.name,
			element.description,
			h.l(element.date, format: :short),
			h.l(element.created_at, format: :short),
			h.l(element.updated_at, format: :short)
		]
	end

	def url(element)
		element.id
	end

	def model
		Gallery
	end

end
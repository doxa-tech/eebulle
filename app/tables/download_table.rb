class DownloadTable < BaseTable

	def attributes(element)
		[
			element.id,
			element.name,
			element.file_url,
			element.extension,
			element.size,
			h.l(element.created_at, format: :short),
			h.l(element.updated_at, format: :short)
		]
	end

	def url(element)
		element.id
	end

	def model
		Download
	end

end
class ActivityTable < BaseTable

	def attributes
		[:id, :name, :content, :time, :main, {recurrence: :name}, :created_at, :updated_at]
	end

	def model
		Activity
	end

end

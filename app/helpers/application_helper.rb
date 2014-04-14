module ApplicationHelper

	def present(table)
		render 'table', presenter: table
	end

	def authorized?(level = 4)
    unless current_user && current_user.level <= level
      return false
    else
    	return true
    end
  end
	
end

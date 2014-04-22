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

  def link_to_active(label,path)
    link_to label, path, class: (current_page?(path)? 'active' : nil)
  end
	
end

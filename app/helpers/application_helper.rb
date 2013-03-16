module ApplicationHelper

	# Return a link for use in layout navigation.
	def nav_link(text, controller, action="index")
		link_to text, :controller => controller,
									 :action => action
	end

end

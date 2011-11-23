module ApplicationHelper
	# Return a title on a per-page basis.
	def title
		base_title ="Tracker Hero App "
		if @ticket.nil?
			if @title.nil?
				base_title
			else
				"#{base_title} | #{@title}"
			end
		else
			"#{base_title} | #{@ticket.title}"
		end
	end
end


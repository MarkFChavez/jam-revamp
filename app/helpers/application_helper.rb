module ApplicationHelper
	def page_title(title)
		content_for :title do
			if title
				"JAM | #{title}"
			else
				"JAM"
			end
		end
	end
end

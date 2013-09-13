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

	def g(member, klazz, gravatar={})
		gravatar_image_tag(member.email, class:klazz, gravatar: {size: gravatar[:size]})
	end	
end

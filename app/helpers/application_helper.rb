module ApplicationHelper

	def full_title(page_title)
		base_title = "March of the Meanies"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def random
		rand(Comic.all.count)+1
	end
end

module ApplicationHelper

def javascript(*files)
	content_for(:head) { javascript_include_tag(*files) }
end

def stylesheet(*files)
	content_for(:head) {stylesheet_include_tag(*files) }
end

def title(page_title, opitions={})
	content_for(:title, page_title.to_s)
	content_for(:intro, page_title.to_s)

end

end

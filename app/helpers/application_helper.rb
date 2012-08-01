module ApplicationHelper
  def full_title(page_title)
    base_title = "ThaThings - Searle Consulting"
    if page_title.empty?
      return base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  # Request from an iPhone or iPod touch? (Mobile Safari user agent)
  def iphone_user_agent?
    request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(Mobile\/.+Safari)/]
  end
  
end

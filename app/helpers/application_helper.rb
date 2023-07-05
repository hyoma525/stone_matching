module ApplicationHelper
  def page_title
    title = "StoneMatching" #これがサイトのブランド名
    title = @page_title + " | " + title if @page_title
    title
  end
end

module ApplicationHelper
  def btn(content)
    "<i class='material-icons'>#{content}</i>".html_safe
  end
end

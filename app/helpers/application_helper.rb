module ApplicationHelper
  def notice_msg
      if flash[:notice]
        content_tag(:div, class: "alert alert-success") do
          flash[:notice]
        end
      end
    end

  def alert_msg
    if flash[:alert]
      content_tag(:div, class: "alert alert-danger") do
        flash[:alert]
      end
    end
  end
end

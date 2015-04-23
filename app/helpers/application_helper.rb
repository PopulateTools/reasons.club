module ApplicationHelper

  def flash_message
    if flash[:error]
      content_tag(:div, class: "alert alert-error") do
        flash[:error]
      end
    elsif flash[:success]
      content_tag(:div, class: "alert alert-success") do
        flash[:success]
      end
    end
  end

  def modal_flash_message(modal)
    flash_type = "modal_#{modal}_error".to_sym

    if flash[flash_type]
      content_tag(:div, class: "alert alert-error") do
        flash[flash_type]
      end
    end
  end

  def twitter_login_path
    '/login/auth/twitter'
  end

  def reason_path(reason)
    issue_path(reason.issue, :anchor => "#{reason.public_id.to_s}")
  end

  

  
end

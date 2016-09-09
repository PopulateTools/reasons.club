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

  def nick_and_name(user)
    if nick(user)
      "<strong>#{nick(user)}</strong> #{user.name}".html_safe
    else
      user.name
    end
  end

  def nick(user)
    if user.twitter_handle.present?
      "<strong class='tipsit-n' title='#{user.name}'>@#{user.twitter_handle}</strong>".html_safe
    else
      user.name
    end
  end

  def twitter_login_path
    '/login/auth/twitter'
  end

  def reason_path(reason)
    issue_path(reason.issue, :anchor => "#{reason.public_id.to_s}")
  end

  def reason_url(reason)
    issue_url(reason.issue, :anchor => "#{reason.public_id.to_s}")
  end

  def markdown(text)
    return if text.blank?

    options = {
      filter_html:     true,
      hard_wrap:       true,
      link_attributes: { rel: 'nofollow', target: "_blank" },
      space_after_headers: true,
      fenced_code_blocks: true
    }

    extensions = {
      autolink:           true,
      superscript:        true,
      disable_indented_code_blocks: true
    }

    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end

  def css_class_if(css_class, condition)
    "class='#{css_class}'".html_safe if condition
  end
end

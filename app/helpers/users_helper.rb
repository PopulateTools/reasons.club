module UsersHelper 


  def gravatar_for(user, options = { size: 80, only_url: false } )
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    if options[:only_url] == true
      gravatar_url
    else
      image_tag(gravatar_url, class: "gravatar")
    end
  end

end
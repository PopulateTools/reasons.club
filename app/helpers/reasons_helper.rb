module ReasonsHelper

  def user_voted_for(reason)
    if user_signed_in? && (current_user.voted_for? reason)
      true
    end
  end

  

end

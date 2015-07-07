module ReasonsHelper

  def user_voted_for(reason)
    if user_signed_in? && (current_user.voted_for? reason)
      true
    end
  end

  def render_reasons_counter issue, argument
    render(
      partial: 'reasons/reasons_counter',
      locals: {
        reasons_count: issue.reasons.send(argument).count,
        destination: argument,
      }
    )
  end

end

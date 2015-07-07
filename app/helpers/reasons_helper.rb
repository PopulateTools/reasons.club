module ReasonsHelper

  def user_voted_for(reason)
    if user_signed_in? && (current_user.voted_for? reason)
      true
    end
  end

  def render_reasons_counter(issue, argument)
    render(
      partial: 'reasons/reasons_counter',
      locals: {
        reasons_count: issue.reasons.send(argument).count,
        argument: argument
      }
    )
  end

  def render_reasons_list(issue, argument)
    render(
      partial: 'reasons/reasons_list',
      locals: {
        issue: issue,
        argument: argument
      }
    )
  end
end

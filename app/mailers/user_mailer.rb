class UserMailer < ApplicationMailer

  default from: 'Reasons.club <discuss@reasons.club>'
 
  def welcome_email(user)
    @user = user
    @user_name = user.name
    @user_url  = user_profile_url(user)
    mail(to: @user.email, bcc: "alvaro+reasons@furilo.com", subject: t('mailer.lets_start', user_name: @user_name, user_url: @user_url))
  end

  def new_vote_on_your_reason(voter, reason)
    @voter = voter.name
    @user_name = reason.user.name
    @reason = reason.title
    @reason_url = issue_reason_url(reason.issue_id, reason)
    mail(to: reason.user.email, bcc: "alvaro+reasons@furilo.com", subject: t('mailer.new_vote_on_your_reason_subject', user_name: @user_name, voter: @voter, reason: @reason, reason_url: @reason_url))
  end

  def new_reason_on_your_issue(voter, issue)
    @voter = voter.name
    @user_name = issue.user.name
    @issue = issue.title
    @issue_url = issue_url(issue)
    mail(to: issue.user.email, bcc: "alvaro+reasons@furilo.com", subject: t('mailer.new_reason_on_your_issue_subject', user_name: @user_name, voter: @voter, issue: @issue, issue_url: @issue_url))
  end

  def new_vote_on_your_issue(voter, reason)
    @voter = voter.name
    @user_name = reason.issue.user.name
    @reason = reason.title
    @issue = reason.issue.title
    @issue_url = issue_url(reason.issue)
    mail(to: reason.issue.user.email, subject: t('mailer.new_vote_on_your_issue_subject', user_name: @user_name, voter: @voter, reason: @reason, issue: @issue, issue_url: @issue_url))
  end

  # def new_club(voter, reason)
  #   @voter = voter.name
  #   @user_name = reason.issue.user.name
  #   @reason = reason.title
  #   @issue = reason.issue.title
  #   @issue_url = issue_url(reason.issue)
  #   mail(to: reason.issue.user.email, subject: t('mailer.new_vote_on_your_issue_subject', user_name: @user_name, voter: @voter, reason: @reason, issue: @issue, issue_url: @issue_url))
  # end

end

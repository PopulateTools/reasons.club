class UserMailer < ApplicationMailer
  default from: 'Reasons.club <discuss@reasons.club>',
          bcc: "alvaro+reasonsbcc@furilo.com"

  def welcome_email(user)
    @user = user
    @user_name = user.name
    @user_url  = user_profile_url(user)
    mail(to: @user.email, subject: t('mailer.lets_start', user_name: @user_name, user_url: @user_url))
  end

  def new_vote_on_your_reason(voter, reason)
    @voter = voter.name
    @user_name = reason.user.name
    @reason = reason.title
    @reason_url = issue_url(reason.issue)
    mail(to: reason.user.email, subject: t('mailer.new_vote_on_your_reason_subject', user_name: @user_name, voter: @voter, reason: @reason, reason_url: @reason_url))
  end

  def new_reason_on_your_issue(voter, issue, reason)
    @voter = voter.name
    @user_name = issue.user.name
    @issue = issue.title
    @reason = reason
    @issue_url = issue_url(issue)
    mail(to: issue.user.email, subject: t('mailer.new_reason_on_your_issue_subject', user_name: @user_name, voter: @voter, reason: @reason, issue: @issue, issue_url: @issue_url))
  end

  def new_vote_on_your_issue(voter, reason)
    @voter = voter.name
    @user_name = reason.issue.user.name
    @reason = reason.title
    @issue = reason.issue.title
    @issue_url = issue_url(reason.issue)
    mail(to: reason.issue.user.email, subject: t('mailer.new_vote_on_your_issue_subject', user_name: @user_name, voter: @voter, reason: @reason, issue: @issue, issue_url: @issue_url))
  end

  def new_notifications_digest(user, digest_messages, period_type)
    @messages = digest_messages
    @user = user
    @period_type =  t("mailer.new_notifications_digest_notification_type_#{Subscription.email_subscription_modes.invert[period_type]}")
    mail(to: user.email,
         subject: t('mailer.new_notifications_digest_subject'))
  end
end

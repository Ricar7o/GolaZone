class UserMailer < ActionMailer::Base
  default from: ENV["GMAIL_ACCOUNT"]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.campaign_invitation.subject
  #


  # Sends an email to a friend to join a campaign
  #
  # invitation - the Invitation object. Contains sender, recipient (with name & email), a message and the campaign.
  #
  # Returns nothing.
  def campaign_invitation(invitation)
    # @from = invitation.user_id
    # @to_name = invitation.to_name
    # @to_email = invitation.to_email
    # @message = invitation.message
    # @campaign = invitation.campaign_id
    @invitation = invitation

    mail to: "#{@invitation.to_email}", subject: t("user_mailer.campaign_invitation.subject", from: @invitation.user.full_name)

    # mail to: "#{@to_user.email}", subject: t("user_mailer.campaign_invitation.subject", from_user: @from_user, to_user: @to_user, message: @message)
  end
end

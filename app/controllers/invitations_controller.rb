class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(params[:invitation])
    if Competition.where(user_id: User.where(email: @invitation.to_email).first, campaign_id: params[:campaign_id]).blank?
      @invitation.user_id = current_user.id
      @invitation.campaign_id = params[:campaign_id]
      @campaign = @invitation.campaign
      @user_competing = !@campaign.competitions.where(user_id: current_user).blank?
      if @invitation.save
        render partial: 'competitions/index', status: 200
        UserMailer.campaign_invitation(@invitation).deliver
      else
        render text: "#{params[:invitation][:to_email]} has already been invited", status: 406
      end
    else
      render text: "#{params[:invitation][:to_email]} is already competing in this campaign", status: 406
    end
  end

  def destroy
    @invitation = Invitation.destroy(params[:id]) if Invitation.find(params[:id]).to_email = current_user.email
    @invitations = Invitation.where(to_email: current_user.email)

    respond_to do |format|
      format.html { render partial: "invitations/pending", notice: "The invitation has been rejected" }
      format.js { render partial: "invitations/pending" }
    end
  end

  def accept
    @invitation = Invitation.find(params[:invitation_id])
    @invitation.destroy
    @invitations = Invitation.where(to_email: current_user.email)
    @competition = Competition.create(user_id: current_user.id, campaign_id: params[:campaign_id])
    @competitions = Competition.where(user_id: current_user.id)

    respond_to do |format|
      format.html { redirect_to @competition.campaign }
      format.js { render layout: false }
    end
  end

end

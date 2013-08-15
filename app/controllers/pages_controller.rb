class PagesController < ApplicationController

  def index
    if user_signed_in?
      @invitations = Invitation.where(to_email: current_user.email)
      @competitions = Competition.where(user_id: current_user.id)
    end
  end

  def new
  end

end

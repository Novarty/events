class MembersController < ApplicationController
  respond_to :js

  expose :member

  def create
    member.user = current_user
    member.save
  end

  private

  def member_params
    params.require(:member).permit(
      :name,
      :phone,
      :event_id
    )
  end
end

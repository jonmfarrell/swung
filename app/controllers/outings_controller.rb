class OutingsController < ApplicationController
  
  def create
    begin
      outing = Outing.create 
      UserOuting.create(user_id: params[:outing][:first_user_id], outing_id: outing.id)
      UserOuting.create(user_id: params[:outing][:second_user_id], outing_id: outing.id)

      redirect_to users_path, :flash => {:notice => "Invite sent!"}
    rescue
      redirect_to users_path, :flash => {:notice => "Stuff is broken!"}
    end
  end
end
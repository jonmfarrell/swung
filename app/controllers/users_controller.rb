class UsersController < ApplicationController
  def index
    # TODO: DON'T SHOW CURRENT
    # SHOW MATCHED USERS
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
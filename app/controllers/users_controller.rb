class UsersController < ApplicationController
  def index
    # TODO: DON'T SHOW CURRENT
    # SHOW MATCHED USERS
    @users = User.all
  end

  def show
    User.find(params[:id])
  end
end
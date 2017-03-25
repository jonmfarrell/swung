class TeamsController < ApplicationController
  def show
    Team.find(params[:id])
  end
end
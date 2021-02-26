class TeamsController < ApplicationController
  load_and_authorize_resource except: %i[create]
  before_action :set_users

  def index
    @teams = visible_teams
  end

  def show
    @team = Team.includes(:users).find(params[:id])
  end

  def new
    @team = Team.new
  end

  def create
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_url, notice: 'Team was successfully removed.'
  end

  private
  
  def set_users
    @account_users ||=
    current_account.users.where.not(invitation_accepted_at: nil) +
    current_account.users.with_role(:admin).uniq
  end
  
  
end
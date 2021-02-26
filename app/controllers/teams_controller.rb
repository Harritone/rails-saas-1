class TeamsController < ApplicationController
  load_and_authorize_resource except: %i[create]
  around_action :use_time_zone, only: %i[edit]

  def index
    @teams = visible_teams
  end

  def show
    @team = Team.includes(:users).find(params[:id])
  end

  def new
    @team = Team.new
    set_users
  end

  def create
    @team = Team.new(team_params.except('days'))
    @team.account_id = current_account.id
    @team.days = days
    convert_zone_times_to_utc
    authorize!(:create, @team)
    if @team.save
      redirect_to @team, notice: 'Team was successfully created.'
    else
      set_users
      render :new
    end
  end

  def edit 
    @team = Team.find(params[:id])
    set_users
  end

  def update 
    @team = Team.find(params[:id])
    @team.attributes = team_params.except('days')
    @team.days = days
    convert_zone_times_to_utc

    if @team.save
      redirect_to teams_url, notice: 'Team was successfully updated.'
    else
      set_users
      render :edit
    end
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
  
  def team_params
    params.require(:team).permit(:name, :desctiption, :timezone, :has_reminder, :has_recap, :reminder_time, :recap_time, days: [], user_ids: [])
  end
  
  def days
    params[:team][:days]
    &.map do |day|
      DaysOfTheWeekMembership.new(
      team_id: @team.id,
      day: day
      )
    end || []
  end

  def convert_zone_times_to_utc
    convert_reminder
    convert_recap
  end

  def convert_reminder
    return nil unless @team.reminder_time && @team.has_reminder

    @team.reminder_time =
      ActiveSupport::TimeZone[@team.timezone]
      .parse(@team.reminder_time.to_s[11..18])
      .utc
  end

  def convert_recap
    return nil unless @team.recap_time && @team.has_recap

    @team.recap_time =
      ActiveSupport::TimeZone[@team.timezone]
      .parse(@team.recap_time.to_s[11..18])
      .utc
  end

  def use_time_zone(&block)
    Time.use_zone(@team.timezone, &block)
  end
  
end
class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit destroy update ]
  before_action :set_users, only: %i[ index ]
  load_and_authorize_resource

  def index
    # unless current_user.has_role?('admin', current_user.account) 
    #   redirect_to root_path, notice: 'You are not authorized'
    # end
  end


  def new
    @user = User.new
    set_choices
  end

  def edit
    set_choices
  end

  def me 
    @user = current_user
  end

  def password 
    @user = current_user
  end

  def update_password
    @user = current_user
    respond_to do |format|
      if @user.update(user_password_params)
        bypass_sign_in(@user)
        format.html {
          redirect_to my_password_path,
          notice: 'Password was successfully updated.'
        }
      else
        format.html {render :password}
      end
    end
  end

  def update_me
    @user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html do
          redirect_to my_settings_path,
                      notice: 'Your information was successfully updated.'
        end
      else
        format.html { render :me }
      end
    end
  end

  def create
    @user = User.unscoped.new(user_params.except('role'))
    @user.account = current_account
    @user.password = 'password'

    respond_to do |format|
      begin
        if @user.valid? && @user.invite!(current_user)
          @user.add_role user_params[:role].to_sym, current_account
          format.html {
            redirect_to account_users_path,
            notice: 'User was sucessfully invited.'
          }
        else
          set_choices
          format.html { render :new }
        end
      rescue ActiveRecord::RecordNotUnique
        flash[:alert] = 'Email should be unique'
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params.except('role'))
        format.html do
          redirect_to account_users_path,
                      notice: 'User was successfully updated.'
        end
      else
        set_choices
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { 
        redirect_to account_users_path,
        notice: 'User was successfully removed.'
       }
       format.json { head :no_content }
    end
  end
  

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_users
    @users = current_account.users
  end

  def set_choices
    @choices = [['Admin', 'admin'], ['User', 'user']]
  end

  def user_password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:name, :email, :role, :time_zone)
  end
end

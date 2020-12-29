# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_user, only: [:create]
  
  protected
  
  def reject_user
    @user = User.find_by(email: params[:user][:email][:name].downcase)
    if @user
      if (@user.vaild_password?(params[:user][:password]) && (@user.active_for_authentication == false))
        flash[:alert] = "このアカウントは退会済です！"
        redirect_to new_user_session_path
      end
    else
    end
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end

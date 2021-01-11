class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :gym_search

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  def gym_search # ransack検索メソッド
    @search = Gym.ransack(params[:q])
    @search_gyms = @search.result(distinct: true).order(created_at: "DESC").includes(:user).page(params[:page]).per(20) # ジム検索一覧
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
  end
end

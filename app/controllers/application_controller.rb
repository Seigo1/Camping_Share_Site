class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # CSRF対策
  protect_from_forgery with: :exception

  protected
  # 名前のデータ操作を許可する。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :created_at, :updated_at])
  end
# ログイン後のリンク分岐
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        admin_path
    else
      if params[:commit] == "新規登録"
        user_path(resource_or_scope)
      else
        root_path
      end
    end
  end
# ログアウト後のリンク分岐
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end

  before_action :set_search

  def set_search
    @search = Content.ransack(params[:q])
    @search_contents = @search.result.page(params[:page])
  end
end
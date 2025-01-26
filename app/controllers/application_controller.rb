class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
 #全てのコントローラに対する処理を行える権限を持つ、ApplicationControllerに記述する
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

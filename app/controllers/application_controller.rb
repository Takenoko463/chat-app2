class ApplicationController < ActionController::Base
  #loginしていないならtop pageに戻す
  before_action :authenticate_user!
  #deviseに関するコントローラーの時だけ実行
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  #deviseに関するパラメーターの許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

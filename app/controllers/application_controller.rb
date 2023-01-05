class ApplicationController < ActionController::Base
  before_action :configure_parmitted_prameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:top]

  def after_sign_in_path_for(resource)
    post_images_path
  end

  # def after_sign_out_path_for(resource)
  #   about_path
  # end

  protected
    def configure_parmitted_prameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end

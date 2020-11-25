class ApplicationController < ActionController::Base
  # tell app to use devise for auths
  before_action :authenticate_user!
  # add the new fields to strong params for devise
  before_action :configure_permitted_parameters, if: :devise_controller?
  # pundit used for auths
  include Pundit
  # these lines give the instruction to auth with pundit on pages that aren't devise or any index page
  after_action :verify_authorized, except: [:index, :privacy], unless: :devise_controller?
  after_action :verify_policy_scoped, only: :index

  protected

  # adding new fields to sign up and edit pages for devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:dpn, :coc, :name, :surname, :postcode, :phone_number])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :surname, :postcode, :phone_number])
  end
end

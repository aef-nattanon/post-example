# frozen_string_literal: false

# Class ApplicationController
class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:warning] = t("#{policy_name}.#{exception.query}", scope: 'pundit')
    redirect_back fallback_location: root_path
  end
end

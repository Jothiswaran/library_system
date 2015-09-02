
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include SessionsHelper
  include BorrowsHelper
  protect_from_forgery 
  filter_parameter_logging :password
  def authenticate
    deny_access unless signed_in?
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
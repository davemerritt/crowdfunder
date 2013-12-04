class ApplicationController < ActionController::Base
  before_filter :require_login
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  #def current_project
  #project = Project.id
  #	Pledge.where( :project_id => project.id ).where( :user_id => user.id )
  #end
  
  #helper_method :current_project

  private
  def not_authorized
  	redirect_to login_path, alert: "Please login first"
  end
end

class ApplicationController < ActionController::Base
  before_action :current_user

  def authenticate_user!
    redirect_to login_path, alert: "You must be logged in to access this page." unless current_user
  end
  
  #pulled when debugging ^

  def current_user
    # puts "------------------ code before every request ------------------"
    @current_user = User.find_by({ "id" => session["user_id"] })
  end
end
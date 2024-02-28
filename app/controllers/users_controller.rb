class UsersController < ApplicationController
  def show
    @user = User.find_by({ "id" => params["id"] })
  end

  def new
  end

  def create
    user = User.find_by({ "email" => params["email"] })
    if user == nil
      @user = User.new
      @user["username"] = params["username"]
      @user["email"] = params["email"]
      @user["password"] = BCrypt::Password.create(params["password"])
      @user.save
      redirect_to "/login"
    else
      flash["notice"] = "Email taken."
      redirect_to "/users/new"
    end
  end
end
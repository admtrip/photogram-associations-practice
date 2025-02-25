class UsersController < ApplicationController
  def index
    @users = User.all
    render("users/index")
  end

  def show
    @the_user = User.find_by(username: params[:username])

    if @the_user.nil?
      redirect_to("/users", alert: "User not found.")
    else
      render("users/show")
    end
  end

  def create
    new_user = User.new(username: params[:username])

    if new_user.save
      redirect_to("/users/#{new_user.username}")
    else
      redirect_to("/users", alert: "Failed to create user.")
    end
  end

  def update
    @the_user = User.find_by(id: params[:user_id])

    if @the_user
      @the_user.update(username: params[:username])
      redirect_to("/users/#{@the_user.username}")
    else
      redirect_to("/users", alert: "User not found.")
    end
  end
end

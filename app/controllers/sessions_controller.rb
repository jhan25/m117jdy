class SessionsController < ApplicationController
    def create
      user = User.from_omniauth(request.env["omniauth.auth"])
      session[:user_id] = user.id
      current_user.initsi = true
      current_user.save
      redirect_to home_show_path
    end

    def destroy
      current_user.initsi = true
      current_user.save
      session[:user_id] = nil
      redirect_to root_path
    end
end

# coding: utf-8
class SessionsController < ApplicationController

protect_from_forgery
include SessionsHelper

  def new
    @title = "Вход"
  end

 def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    if user.nil?
      flash.now[:error] = "Email не существует либо пароль неверен."
      @title = "Войти"
      render 'new'
    else
      sign_in user
      redirect_back_or user
    end
  end

   def destroy
     sign_out
     redirect_to root_path
  end
end
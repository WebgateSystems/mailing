# encoding: utf-8
class SessionsController < ApplicationController
  layout 'login'
  def create
    user = login(params[:email], params[:password], params[:remember_me])
    if user
      redirect_back_or_to root_url, :notice => "Logged in as #{user.email}."
    else
      flash.now.alert = "Email or password was invalid"
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url, :notice => "Logged out."
  end
end

# encoding: utf-8
class UserConfigsController < ApplicationController
  before_filter :require_login

  def show
    @user_config = UserConfig.find_by_user_id(current_user.id)
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @user_config = UserConfig.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @user_config = UserConfig.find_by_user_id(current_user.id)
  end

  def create
    @user_config = UserConfig.new(params[:user_config])
    @user_config.user_id = current_user.id

    respond_to do |format|
      if @user_config.save
        format.html { redirect_to @user_config, notice: 'Config was saved.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @user_config = UserConfig.find_by_user_id(current_user.id)

    respond_to do |format|
      if @user_config.update_attributes(params[:user_config])
        format.html { redirect_to @user_config, notice: t('config_was_successfully_updated') }
      else
        format.html { render action: "edit" }
      end
    end
  end
end

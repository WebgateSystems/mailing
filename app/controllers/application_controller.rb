# encoding: utf-8
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :common_prepare
  before_filter :set_controller_and_action_names
  
  LANGS = [
    ['ru', 'russian'],
    ['pl', 'polish'],
    ['en', 'english']
  ]

  def common_prepare
    @additional_scripts = []
    @additional_styles = []
    prepare_lang
  end

  def check_config
    redirect_to new_user_config_url if current_user and current_user.user_config.nil?
  end

  def set_controller_and_action_names
    @current_controller = controller_name
    @current_action     = action_name
  end

  def not_authenticated
    redirect_to login_url, :alert => "First login to access this page."
  end

  def short_date(date)
    date.strftime "%d.%m.%Y" if date
  end

  protected

  def not_found
    raise ActionController::RoutingError.new('Not found')
  end

  private
  
  def prepare_lang
    interface_lang = current_user.user_config.lang if current_user and current_user.user_config
    lang = interface_lang || params[:lang] || cookies[:lang] || 'en'
    @current_lang = lang
    cookies[:lang] = lang_by_tag(lang)
    I18n.locale = lang
  end

  def lang_by_tag(lng)
    language = LANGS.detect{|lang| lang.first == lng.downcase}
    language ? language.first : LANGS.first.first
  end

end

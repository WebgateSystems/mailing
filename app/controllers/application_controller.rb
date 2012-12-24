# encoding: utf-8
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :common_prepare
  before_filter :basic_auth
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password

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

  protected

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == "sladk" && password == "sladk56"
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not found')
  end

  private
  
  def prepare_lang
    lang = params[:lang] || cookies[:lang] || 'pl'

    cookies[:lang] = lang_by_tag(lang)
    I18n.locale = lang
#    @tr = (lang == 'ru') ? Russian : I18n
  end

  def lang_by_tag(lng)
    language = LANGS.detect{|lang| lang.first == lng.downcase}
    language ? language.first : LANGS.first.first
  end

  def short_date(date)
    date.strftime "%d.%m.%Y" if date
  end
  
end

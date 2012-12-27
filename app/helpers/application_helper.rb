# encoding: utf-8
module ApplicationHelper
  def select_langs
    [['English', 'en'], ['Polski', 'pl'], ['Русский', 'ru']]
  end

  def lang_human(lang)
    select_langs.each do |l|
      return l[0] if l[1] == lang
    end
  end
end

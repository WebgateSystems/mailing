module LettersHelper
  def select_distributions
    res = []
    @distributions.each{ |d|
      res << [d.title, d.id]
    }
    res
  end
end

module UserConfigsHelper
  def secureport_select
    [
        [ "None (25)", 25 ],
        [ "SSL (465)", 465 ],
        [ "TLS (587)", 587 ]
    ]
  end

  def secureport_human(port)
    res = ''
    secureport_select.each { |sp|
      res = sp[0] if port == sp[1]
    }
    res
  end
end

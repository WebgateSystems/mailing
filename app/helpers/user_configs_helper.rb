module UserConfigsHelper
  def secureport_select
    [
        [ "None (25)", 25 ],
        [ "SSL (465)", 465 ],
        [ "STARTTLS/TLS (587)", 587 ]
    ]
  end

  def secureport_human(port)
    res = ''
    secureport_select.each { |sp|
      res = sp[0] if port == sp[1]
    }
    res
  end

  def auth_select
    [
        ["Plain", "plain"],
        ["Login", "login"]
    ]
  end

  def openssl_verify_mode_select
    [
        ["none", "none"],
        ["peer", "peer"],
        ["client_once", "client_once"],
        ["fail_if_no_peer_cert", "fail_if_no_peer_cert"],
    ]
  end
end

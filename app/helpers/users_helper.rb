module UsersHelper
  def gravatar_url(user, options = { size: 80 })
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
  end
  
  
  def best_placeholder 
    <<-"EOS".strip_heredoc
フルマラソン: 3時間00分00秒　　
5000m: 20'00"00　　　　　　　　
    EOS
  end
  
  def race_placeholder 
    <<-"EOS".strip_heredoc
東京マラソン　　
〇月〇日 〇〇記録会:5000m　　　　　　　　
    EOS
  end
  
  def target_placeholder 
    <<-"EOS".strip_heredoc
フルマラソン: 3時間00分00秒　　
5000m: 20'00"00　　　　　　　　
    EOS
  end
end

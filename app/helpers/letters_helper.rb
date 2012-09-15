module LettersHelper

  def fb_share_url(letter)
    "http://www.facebook.com/dialog/feed?app_id=#{Settings.fb_key}&link=#{letter_url(letter)}&picture=#{Settings.fb_picture}&caption=#{Settings.fb_caption}&name=#{Settings.app_name}&description=#{letter.contents}&redirect_uri=#{Settings.host}"
  end

  def twitt_share_url(letter)
    "http://twitter.com/?status=#{letter.contents} ##{Settings.app_name} #{Settings.fb_caption}"
  end
end

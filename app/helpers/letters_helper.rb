module LettersHelper

	def fb_share_url(letter)
		"http://www.facebook.com/dialog/feed?app_id=502056609805917&link=#{letter_url(letter)}&picture=http://s3-ap-northeast-1.amazonaws.com/ulabla-image/logo.png&name=Bamboo&caption=http://bit.ly/bamboo_forest&caption=%20&description=#{letter.contents}&redirect_uri=http://gentle-refuge-4246.herokuapp.com/"
	end

	def twitt_share_url(letter)
		"http://twitter.com/?status=urlencode(abc#{letter.contents} # http://bit.ly/bamboo_forest)"
	end
end

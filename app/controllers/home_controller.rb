class HomeController < ApplicationController

	def index
		if Userbin.user_logged_in?
			redirect_to profile_path
		end
	end
end

class HandshakesController < ApplicationController
	def create
		@user = User.find(params[:handshake][:followed_id])
		current_user.handshake!(@user)
		respond_to do |f|
			f.html { redirect_to users_path }
			f.js
		end
	end

	private

	def handshake_params
		params.require(:handshake).permit(:followed_id)
	end
end

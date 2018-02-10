class UserController < ApplicationController
	
	get '/' do
		@users = User.all
		resp = {
			status: {
				success: true,
				message: "Testing route /user working"
			},
			users: @users 
		}
		resp.to_json
	end

	post '/' do
		payload = params
		payload = JSON.parse(request.body.read).symbolize_keys

		p payload
		p params
		@user = User.new
		@user.firstname = payload[:firstname]
		@user.lastname = payload[:lastname]
		@user.email = payload[:email]
		@user.password = payload[:password]
		@user.save
		# session[:logged_in] = true
		# session[:username] = @user.firstname
		# session[:user_id] = @user.id
		# session[:message] = "Welcome!"

		@user.to_json
		# redirect '/items'
	end
end

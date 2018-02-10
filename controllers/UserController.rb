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

	post '/login' do
		payload = params
		payload = JSON.parse(request.body.read).symbolize_keys

		@pw = payload[:password]

		@user = User.find_by(email: payload[:email])
		if @user && @user.authenticate(@pw)
			session[:logged_in] = true
			session[:username] = @user.firstname
			session[:user_id] = @user.id
			session[:message] = "Logged in as #{@user.firstname}"
		else
			session[:message] = "Invalid username or password"
		end
		session.to_json
	end

	post '/' do
		payload = params
		payload = JSON.parse(request.body.read).symbolize_keys

		@user = User.new
		@user.firstname = payload[:firstname]
		@user.lastname = payload[:lastname]
		@user.email = payload[:email]
		@user.password = payload[:password]
		@user.save
		session[:logged_in] = true
		session[:username] = @user.firstname
		session[:user_id] = @user.id
		session[:message] = "Welcome!"

		session.to_json
	end
end

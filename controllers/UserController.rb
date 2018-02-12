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
			p "----------FOUND USER"
		else
			session[:message] = "Invalid username or password"
			p "INVALID SIGN IN"
		end

		session.to_json
		
	end

	# post '/edit' do
	# 	payload = params
	# 	payload = JSON.parse(request.body.read).symbolize_keys

	# 	if @user = User.where(email => payload[:email]).first and @user.id != session[:user_id]
	# 		session[:message] = "Email already exists"
	# 		p "testing if used email true"
	# 	elsif @user = User.where(username => payload[:username]).first and @user.username != session[:username]
	# 		session[:message] = "Username already exists"
	# 		p "testing if used username true"
	# 	else
	# 		@user = User.find_by(id: payload[:email])
	# 	end
	# end

	post '/' do
		payload = params
		payload = JSON.parse(request.body.read).symbolize_keys

		if User.find_by(email: payload[:email])
			@message = "false"
			@message.to_json
		else
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
end

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
			session[:id] = @user.id
			session[:message] = "Logged in as #{@user.firstname}"

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

	# the route might be wrong below, but it works with front end
	get '/:id' do  
		@user = User.find params[:id]
		resp = {
			status: {
				success: true,
				message: "this is one user retrieved by user id"
			},
			users: @user 
		}
		resp.to_json

	end

	put '/edit/:id' do
		payload = JSON.parse(request.body.read).symbolize_keys
		@user = User.find_by(id: params[:id])
		@user.firstname = payload[:firstname]
		@user.lastname = payload[:lastname]
		@user.email = payload[:email]
		# user should not be able to change his email after registering
		# @user.password = payload[:password]
		@user.save 
		resp = {
			status: {
				success: true,
				message: "User info updated"
			},
			users: @user
			}
		resp.to_json
		

	end


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

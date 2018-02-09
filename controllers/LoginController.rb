class LoginController < Sinatra::Base

	require 'bundler'
	Bundler.require()

	register Sinatra::CrossOrigin

	ActiveRecord::Base.establish_connection(
 		:adapter => 'postgresql', 
 		:database => 'videogame'
	)

	configure do
    	enable :cross_origin
  	end

	set :allow_origin, :any
	set :allow_methods, [:get, :post, :options, :put, :delete]
	set :allow_credentials, true

	set :views, File.expand_path('../views', File.dirname(__FILE__))

	options "*" do
	  response.headers["Allow"] ="HEAD, GET, PUT, POST, DELETE, OPTIONS"
	  response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"

	end

	# Read Many Route
	get '/' do
		resp = {
			status: {
				success: true,
				message: "Testing route"
			}
		}
		resp.to_json
	end

	not_found do
    	erb :not_found
  	end

end
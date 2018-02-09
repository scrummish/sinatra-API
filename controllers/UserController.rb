class UserController < ApplicationController
	# Read Many Route
	get '/' do
		resp = {
			status: {
				success: true,
				message: "Testing route /user"
			}
		}
		resp.to_json
	end

	not_found do
    	erb :not_found
  	end

end

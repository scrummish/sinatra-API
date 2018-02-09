require 'sinatra/base'
require 'sinatra/activerecord'

# controllers
require './controllers/LoginController'

# models
# require './models/GameModel'

# routes
map('/login') {
	run LoginController
}
require 'sinatra/base'
require 'sinatra/activerecord'

# controllers
require './controllers/ApplicationController'
require './controllers/UserController'
require './controllers/IncidentController'

# models
require './models/UserModel'
require './models/IncidentModel'

# routes
map('/') {
	run ApplicationController
}
map('/user') {
	run UserController
}
map('/incedent') {
	run IncidentController
}
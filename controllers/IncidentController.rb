class IncidentController < ApplicationController

	get '/' do
		@reports = Report.all
		@reports.to_json
	end

	post '/create' do
		p "--------------------------"
		p session[:user_id]
		p "-----------session not working---------------"
		payload = JSON.parse(request.body.read).symbolize_keys

		@report = Report.new
		@report.user_id = session[:user_id]
		@report.type_of_incident = payload[:incidentType]
		@report.location_description = payload[:incidentLocationDescription]
		@report.address = payload[:approximateAddress]
		@report.latitude = payload[:addressLatitude]
		@report.longitude = payload[:addressLongitude]
		@report.save
	end

	get '/myIncidents' do
		@user = User.find session[:user_id]
		@incidents_for_one_civilian = User.incidents.order[:id]
		response = {
			status: {
				all_good: true,
				number_of_results: @incidents_for_one_civilian.length
			},
			incidents: @incidents_for_one_civilian
		}
		response.to_json

	end

	get '/allIncidents' do
		@incidents_for_all_civilians = Incident.all.order[:id]

	end


	post '/newIncident' do
		payload = params
		payload = JSON.parse(request.body.read).symbolize_keys

		@incident = Incedent.new
		@incident.type_of_incident     = payload[:type_of_incident]
		@incident.location_description = payload[:location_description]
		@incident.address              = payload[:address]
		@incident.on_going             = payload[:on_going]

		session[:message] = "You added an incident #{@incident.id}"

	end



end
class IncidentController < ApplicationController

	# Get every users incidents
	get '/' do
		@reports = Report.all
		@reports.to_json
	end

	# Create a new incident Route
	post '/create' do
		payload = JSON.parse(request.body.read).symbolize_keys

		@report = Report.new
		@report.user_id = payload[:userId]
		@report.type_of_incident = payload[:incidentType]
		@report.incident_details = payload[:incidentDetails]
		@report.location_description = payload[:incidentLocationDescription]
		@report.address = payload[:approximateAddress]
		@report.latitude = payload[:addressLatitude]
		@report.longitude = payload[:addressLongitude]
		@report.save

		@report.to_json
	end

	# Edit a users incident route
	put '/edit/:id' do
		payload = JSON.parse(request.body.read).symbolize_keys

		@report = Report.find params[:id]
		@report.type_of_incident = payload[:incidentType]
		@report.incident_details = payload[:incidentDetails]
		@report.location_description = payload[:incidentLocationDescription]
		@report.save

		response = {
			status: {
				all_good: true,
			},
			editedReport: @report
		}

		response.to_json
	end

	# Delete an incident route
	delete '/delete/:id' do
		@report = Report.find params[:id]
		@report.delete

		resp = {
			message: "Deleted"
		}
		resp.to_json
	end

	# Get a users incidents route
	get '/:id/myIncidents' do
		@user = User.find params[:id]

		response = {
			status: {
				all_good: true,
				number_of_results: @user.reports.length
			},
			incidents: @user.reports
		}
		response.to_json
	end
end
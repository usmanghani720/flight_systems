require 'rapidapisdk'
module ApplicationHelper

	def flight_types_to_be_included
	    [
	      ['Economy Class', 'EC'],
	      ['Premium Economy', 'PE'],
	      ['Business Class', 'BC'],
	      ['First Class', 'FC'],
	    ]
  	end

  	def date_into_correct_format(date)
  		@date_into_correct_format = date.to_date.to_formatted_s(:db) 
  	end


  	def parse_response_from_api(response,id)
  		total_flight_options = response["payload"]["trips"]["tripOption"].count - 1
  		for index in 0..total_flight_options
  			Result.create!(departure_time: response["payload"]["trips"]["tripOption"][index]["slice"][0]["segment"][0]["leg"][0]["departureTime"], arrival_time: response["payload"]["trips"]["tripOption"][index]["slice"][0]["segment"][0]["leg"][0]["arrivalTime"], saved_search_id: id, flight_cost: response["payload"]["trips"]["tripOption"][index]["saleTotal"])
  		end
  	end

  	def check_google_service(id,date1, date2, start, des, max, min)
  		d1 = date_into_correct_format(date1) if date1.present?
  		d2 = date_into_correct_format(date2) if date2.present?
		RapidAPI.config(project: airline_configuration_params["project_name"], token: airline_configuration_params["project_token"])
		response = RapidAPI.call(airline_configuration_params["google_api"], airline_configuration_params["trip_type"], { 
			'apiKey': airline_configuration_params["google_api_key"],
			'origin': start,
			'destination': des,
			'passengersAdultCount': '1',
			'passengersChildCount': '0',
			'fromDate': d1,
			'toDate': d2,
			'maxPrice': max,
			'refundable': '',
			'solutions': ''
	})
		if response["payload"]["status_code"] != "API_ERROR"
			parse_response_from_api(response,id)
		end
  	end

  	def airline_configuration_params
		Rails.application.secrets.flight_data
	end
end

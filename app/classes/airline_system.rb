require 'rapidapisdk'
class AirlineSystem
	include ActiveModel::Model
	attr_accessor :saved_search
  	
  	def initialize(obj)
    	self.saved_search = obj
  	end

  	def date_into_correct_format(date)
  		@date_into_correct_format = date.to_date.to_formatted_s(:db) 
  	end

  	def get_airport_code(city_name)
  		if Airport.find_by_city(city_name).present?
  			if Airport.find_by_city(city_name).iata_code == 'N/A' && Airport.where(city: city_name).count > 1
  				Airport.where(city: city_name).where.not(iata_code: 'N/A').first.try(:iata_code)
  			else
  				Airport.find_by_city(city_name).iata_code
  			end
  		else
  			city_name
  		end
  	end

  	def parse_response_from_api(response,id)
  		if response["payload"]["trips"]["tripOption"]
  			total_flight_options = response["payload"]["trips"]["tripOption"].count - 1
  			for index in 0..total_flight_options
  				Result.create!(departure_time: response["payload"]["trips"]["tripOption"][index]["slice"][0]["segment"][0]["leg"][0]["departureTime"].to_datetime.to_formatted_s(:long), arrival_time: response["payload"]["trips"]["tripOption"][index]["slice"][0]["segment"][0]["leg"][0]["arrivalTime"].to_datetime.to_formatted_s(:long), saved_search_id: id, flight_cost: response["payload"]["trips"]["tripOption"][index]["saleTotal"])
  			end
  		end
  	end

  	def check_google_service(obj)
  		d1 = date_into_correct_format(obj.date1) if obj.date1.present?
  		d2 = date_into_correct_format(obj.date2) if obj.date2.present?
  		start = get_airport_code(obj.start.upcase)
  		des = get_airport_code(obj.end.upcase)
		RapidAPI.config(project: airline_configuration_params["project_name"], token: airline_configuration_params["project_token"])
		response = RapidAPI.call(airline_configuration_params["google_api"], airline_configuration_params["trip_type"], { 
			'apiKey': airline_configuration_params["google_api_key"],
			'origin': start,
			'destination': des,
			'passengersAdultCount': '1',
			'passengersChildCount': '0',
			'fromDate': d1,
			'toDate': d2,
			'maxPrice': obj.price_max,
			'refundable': '',
			'solutions': ''
	})
		if response["payload"]["status_code"] != "API_ERROR"
			parse_response_from_api(response,obj.id)
		end
  	end

  	def airline_configuration_params
		Rails.application.secrets.flight_data
	end

end
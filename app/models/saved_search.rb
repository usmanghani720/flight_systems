class SavedSearch < ActiveRecord::Base
	serialize :start
	serialize :end
	#validates_format_of :price_max, :with => /[A-Z] {3} \d+(\.\d+)?/, :on => :create
	#validates_format_of :price_min, :with => /[A-Z] {3} \d+(\.\d+)?/, :on => :create
	#validate :start_date_and_end_date
	before_create :call_flights_api

	def start_date_and_end_date
    	errors.add(:date1, "Starting Date must be less than Ending Date") if self.date1.to_date > self.date2.to_date
  	end

	def call_flights_api
		ApplicationController.helpers.check_google_service(self.id,self.date1,self.date2,self.start,self.end, self.price_max, self.price_min)
	end

	def total_count
		total_passenger_count = adult_count + children_count + infants_on_seat_count + infants_in_lap_count
	end

	def total_children_count
		total_children_count = children_count + infants_on_seat_count + infants_in_lap_count
	end

	delegate :id, :id=, :date1, :date1=, :date2, :date2=, :start, :start=, :end, :end=, :price_min, :price_min=, :price_max, :price_max=, :duration, :duration=, :flight_type, :flight_type=, :flight_class, :flight_class=, :adult_count, :adult_count=, :children_count, :children_count=, :infants_in_lap_count, :infants_in_lap_count=, :infants_on_seat_count, :infants_on_seat_count, :total_children_count, :total_children_count=,  to: :saved_search, prefix: true, allow_nil: true
end

namespace :call_service_after_specific_time do

	task call_service_after_specific_time: :environment do
      	SavedSearch.all.each do |obj|
      		duration_in_minutes = (obj.duration.to_i * 60 * obj.api_hit_count)
      		if TimeDifference.between(obj.created_at, Time.now.utc).in_minutes.floor == duration_in_minutes
      			remove_previous_enteries(obj.id)
      			AirlineSystem.new(obj).check_google_service(obj)
      			count = obj.api_hit_count + 1
      			obj.update_attributes(api_hit_count: count)
			end
		end
	end

	def remove_previous_enteries(id)
		Result.all.each do |obj|
			if obj.saved_search_id == id
				Result.delete(id)
			end
		end
	end

end
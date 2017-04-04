module ApplicationHelper

	def flight_types_to_be_included
	    [
	      ['Economy Class', 'EC'],
	      ['Premium Economy', 'PE'],
	      ['Business Class', 'BC'],
	      ['First Class', 'FC'],
	    ]
  	end

  	def load_airports_data
  		csv_text = File.read(Rails.root.join("lib", "global_airports.csv"))
  		csv = CSV.parse(csv_text, :headers => true)
		csv.each do |row|
  			Airport.create!(row.to_hash)
  		end
	end

end

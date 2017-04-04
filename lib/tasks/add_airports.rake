namespace :add_airports do	
	task add_airports: :environment do
	  	csv_text = File.read(Rails.root.join("lib", "global_airports.csv"))
	  		csv = CSV.parse(csv_text, :headers => true)
			csv.each do |row|
	  			Airport.create!(row.to_hash)
	  		end
	  	puts "Airports added to the database"
	end
end


class Result < ActiveRecord::Base
	default_scope { order(saved_search_id: :desc) }
end

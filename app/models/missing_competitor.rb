class MissingCompetitor < ActiveRecord
	belongs_to :ring, optional: true
end

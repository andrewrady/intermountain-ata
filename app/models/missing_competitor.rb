class MissingCompetitor < ApplicationRecord
	belongs_to :ring, optional: true
end

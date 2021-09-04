class Ring < ActiveRecord
	has_many :missing_competitors, :dependent => :destroy
end

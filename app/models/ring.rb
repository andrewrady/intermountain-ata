class Ring < ApplicationRecord 
	has_many :missing_competitors, :dependent => :destroy
end

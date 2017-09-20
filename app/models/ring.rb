class Ring < ActiveRecord::Base
	has_many :missing_competitors, :dependent => :destroy
end

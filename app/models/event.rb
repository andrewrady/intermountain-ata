class Event < ActiveRecord::Base
	has_attached_file :schedule, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :schedule, content_type: ['image/jpeg', 'image/png', 'application/pdf']
end

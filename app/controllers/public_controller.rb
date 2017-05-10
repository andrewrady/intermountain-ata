class PublicController < ApplicationController
  layout 'home'

  def index
		@event = Event.where(:status => true).first
  end

  def about
    #code
  end
end

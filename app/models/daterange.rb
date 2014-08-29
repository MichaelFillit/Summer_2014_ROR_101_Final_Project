class Daterange < ActiveRecord::Base
	belongs_to :dashboard

	validates_presence_of :datefrom
	validates_presence_of :dateto
	
end

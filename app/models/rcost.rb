class Rcost < ActiveRecord::Base
	belongs_to :dashboard
	validates_presence_of :date
	validates_presence_of :title
	validates_presence_of :rcost
end

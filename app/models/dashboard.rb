class Dashboard < ActiveRecord::Base
	belongs_to :user
	has_many :rincomes
	has_many :eincomes
	has_many :rcosts
	has_many :ecosts
	has_many :dateranges
	validates_presence_of :title
	validates_presence_of :balance

	def getdate
		Daterange.last
	end

	def df
		getdate.datefrom
	end
	def dt
		getdate.dateto
	end


	def currentbalance
		return self.balance
	end

	def rincomes_not_zero 
		rincomes.select { |r| r.rincome > 0 && !r.date.nil?}.sort_by! {|ri| ri.date}
	end

	def rincomesum
		risum = 0
		rincomes_not_zero.each do |r|
			risum += r.rincome
		end
		return risum
	end

	def eincomes_not_zero 
		eincomes.select { |e| e.eincome > 0 && !e.date.nil?}.sort_by! {|ei| ei.date}
	end

	def eincomesum
		eisum = 0
		eincomes_not_zero.each do |e|
			eisum += e.eincome
		end
		return eisum
	end

	def tei
		tei = eincomesum + rincomesum
	end

	def rcosts_not_zero 
		rcosts.select { |r| r.rcost > 0 && !r.date.nil?}.sort_by! {|rc| rc.date}
	end

	def rcostsum
		rcsum = 0
		rcosts_not_zero.each do |r|
			rcsum += r.rcost
		end
		return rcsum
	end

	def ecosts_not_zero 
		ecosts.select { |e| e.ecost > 0 && !e.date.nil?}.sort_by! {|ec| ec.date}
	end

	def ecostsum
		ecsum = 0
		ecosts_not_zero.each do |e|
			ecsum += e.ecost
		end
		return ecsum
	end

	def tec
		tec = ecostsum + rcostsum
	end

	def realvalue
		realvalue = 0
		realvalue = (currentbalance + rincomesum - rcostsum)
		return realvalue
	end

	def exprealvalue
		exprealvalue = 0
		exprealvalue = (currentbalance + tei - tec)
		return exprealvalue
	end



	def rangeri
		rincomes_not_zero.select { |r| df <= r.date && dt >= r.date}
	end
	def rangerc
		rcosts_not_zero.select { |r| df <= r.date && dt >= r.date}
	end
	def rangeei
		eincomes_not_zero.select { |r| df <= r.date && dt >= r.date}
	end
	def rangeec
		ecosts_not_zero.select { |r| df <= r.date && dt >= r.date}
	end

	def rangerisum
		rrisum = 0
		rangeri.each do |r|
			rrisum += r.rincome
		end
		return rrisum
	end
	def rangeeisum
		reisum = 0
		rangeei.each do |r|
			reisum += r.eincome
		end
		return reisum
	end
	def rtei
		rtei = rangeeisum + rangerisum
	end

	def rangercsum
		rrcsum = 0
		rangerc.each do |r|
			rrcsum += r.rcost
		end
		return rrcsum
	end
	def rangeecsum
		recsum = 0
		rangeec.each do |r|
			recsum += r.ecost
		end
		return recsum
	end
	def rtec
		rtec = rangeecsum + rangercsum
	end

	def brangeri
		rincomes_not_zero.select { |r| df > r.date}
	end
	def brangerc
		rcosts_not_zero.select { |r| df > r.date}
	end
	def brangeei
		eincomes_not_zero.select { |r| df > r.date}
	end
	def brangeec
		ecosts_not_zero.select { |r| df > r.date}
	end

	def brangerisum
		brrisum = 0
		brangeri.each do |r|
			brrisum += r.rincome
		end
		return brrisum
	end
	def brangeeisum
		breisum = 0
		brangeei.each do |r|
			breisum += r.eincome
		end
		return breisum
	end
	def brtei
		brtei = brangeeisum + brangerisum
	end

	def brangercsum
		brrcsum = 0
		brangerc.each do |r|
			brrcsum += r.rcost
		end
		return brrcsum
	end
	def brangeecsum
		brecsum = 0
		brangeec.each do |r|
			brecsum += r.ecost
		end
		return brecsum
	end
	def brtec
		brtec = brangeecsum + brangercsum
	end

	def rangersb
		rangersb = 0
		rangersb = (currentbalance + brangerisum - brangercsum)
		return rangersb
	end
	def rangeesb
		rangeesb = 0
		rangeesb = (currentbalance + brtei - brtec)
		return rangeesb
	end


	def rangerealvalue
		rangerealvalue = 0
		rangerealvalue = (rangersb + rangerisum - rangercsum)
		return rangerealvalue
	end

	def rangeexprealvalue
		rangeexprealvalue = 0
		rangeexprealvalue = (rangeesb + rtei - rtec)
		return rangeexprealvalue
	end
end

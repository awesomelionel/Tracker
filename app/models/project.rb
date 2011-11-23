class Project < ActiveRecord::Base
	has_many :tickets ,:dependent => :nullify
	validates :name, :presence => true,
		:length => {:maximum => 50}

end

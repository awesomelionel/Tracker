class Project < ActiveRecord::Base
	has_many :tickets
	validates :name, :presence => true,
		:length => {:maximum => 50}

end

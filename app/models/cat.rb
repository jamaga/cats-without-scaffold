class Cat < ActiveRecord::Base

	validates :name, presence: true
	validates :birth_date, presence: true

end

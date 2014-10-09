class Cat < ActiveRecord::Base

	validates :name, presence: true
	validates :birth_date, presence: true

	belongs_to :owner

	mount_uploader :picture, #name of the database field
									CatPictureUploader

end

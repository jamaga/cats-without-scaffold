class Owner < ActiveRecord::Base

	#allow creation of nested models within this 
	#(allow creating cats)

	#when i delete owner, all their cats DIE
	has_many :cats, dependent: :destroy

	accepts_nested_attributes_for :cats,
					 reject_if: lambda { |cat_attrs| cat_attrs['name'].blank? }


end

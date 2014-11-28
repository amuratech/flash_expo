module Admin::DevelopersHelper
	def packages
		["Upto 1 lac", "1 lac to 2 lacs"]
	end

	def get_address1(address)
		address.address1 if address.present?
	end

	def get_city(address)
		address.city if address.present?
	end

	def get_locality(address)
		address.locality if address.present?
	end

	def get_zip(address)
		address.zip if address.present?
	end

end

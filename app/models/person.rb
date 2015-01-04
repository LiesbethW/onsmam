class Person < ActiveRecord::Base


	def name
    if not surname_prefix.blank?
      "#{first_name} #{surname_prefix} #{last_name}"
    else 
      "#{first_name} #{last_name}"
    end
	end
end

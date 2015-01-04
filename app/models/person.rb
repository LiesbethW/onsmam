class Person < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  validates :email, format: { with: /.+@.+\..+/, message: "This is not a valid e-mail address."}, allow_nil: true

	def name
    if not surname_prefix.blank?
      "#{first_name} #{surname_prefix} #{last_name}"
    else 
      "#{first_name} #{last_name}"
    end
	end


end

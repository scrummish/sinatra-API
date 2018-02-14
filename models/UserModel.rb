class User < ActiveRecord::Base
	has_secure_password
	has_many :incidents
	has_many :reports
end
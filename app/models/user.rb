class User < ActiveRecord::Base
   has_many :travels
   has_secure_password 

end 
class Travel < ActiveRecord::Base
    belongs_to :user
    has_many :locations

end

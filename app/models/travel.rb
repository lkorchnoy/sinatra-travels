class Travel < ActiveRecord::Base
    belongs_to :user
    has_many :locations

    validates :name, presence: true
    validates :description, presence: true
    validates :recommendation, presence: true
    
end

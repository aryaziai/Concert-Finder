class Customer < ActiveRecord::Base 
    has_many :tickets
    has_many :concerts, through: :ticket

    validates :username, uniqueness: true
        
end
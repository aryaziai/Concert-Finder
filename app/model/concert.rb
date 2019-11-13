class Concert < ActiveRecord::Base
  has_many :tickets
  has_many :tickets, through: :customers
end

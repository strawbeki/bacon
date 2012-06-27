class Order < ActiveRecord::Base
  
  attr_accessible :filling, :name, :notes, :roll, :sauce

  validates :name, presence: true
  validates :roll, presence: true
  validates :filling, presence: true

end



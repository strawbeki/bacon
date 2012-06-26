class Order < ActiveRecord::Base
  attr_accessible :filling, :name, :notes, :roll, :sauce, :destroy_all

  validates :name, presence: true
  validates :roll, presence: true
  validates :filling, presence: true

  #@order.filling = params[:filling].join(", ")

end



class Orders < ActiveRecord::Base
  attr_accessible :filling, :name, :notes, :roll, :sauce

  validates :name, presence: true
  validates :filling, presence: true
  validates :roll, presence: true
  validates :sauce, presence: true
end



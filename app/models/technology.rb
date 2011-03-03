class Technology < ActiveRecord::Base
  has_many :skilllevels
  has_many :employees, :through => :skilllevels

end

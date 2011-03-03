class Employee < ActiveRecord::Base
  has_many :skilllevels
  has_many :technologies, :through => :skilllevels
 
end

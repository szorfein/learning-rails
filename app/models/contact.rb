class Contact < ActiveRecord::Base
  validates_presence_of :firstname, :surname, :email
end

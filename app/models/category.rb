class Category < ActiveRecord::Base
  has_many :faqs
  validates_presence_of :name
end

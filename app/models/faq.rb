class Faq < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :question
end

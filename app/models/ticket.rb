class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :author, class_name: "User", optional: true
  validates :name, :description, presence: true
  validates :description, length: { minimum: 10 }
  mount_uploader :attachment, AttachmentUploader
end

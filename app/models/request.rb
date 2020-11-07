class Request < ApplicationRecord
  # has_one :document
  # has_many :users
  # attr_accessor :user_data
  mount_uploader :attachment, AttachmentUploader
  validates :docname, presence: true
  validates :attachment, presence: true
end
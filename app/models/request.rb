class Request < ApplicationRecord
  has_many :users
  # accepts_nested_attributes_for :users
  # attr_accessor :user_data
  mount_uploader :attachment, AttachmentUploader
  validates :docname, presence: true
  validates :attachment, presence: true
end
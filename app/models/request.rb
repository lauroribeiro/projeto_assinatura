class Request < ApplicationRecord
  # has_one :document
  mount_uploader :attachment, AttachmentUploader
  validates :docname, presence: true
end
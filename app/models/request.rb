class Request < ApplicationRecord
  # after_update :set_state
  has_many :users, dependent: :destroy
  # accepts_nested_attributes_for :users
  # attr_accessor :user_data
  mount_uploader :attachment, AttachmentUploader
  validates :docname, presence: true
  validates :attachment, presence: true
  
  private
  
  def set_state
    Request.all.each do |request|
      if request.users.length == 0
        request.state = "Pendente"
        return request.save
      end
      request.users.each do |user|
        if user.signed.nil?
          request.state = "Pendente"
        elsif !user.signed
          request.state = "Reprovada"  
        end
      end
      request.state = "Aprovada"
      request.save
    end
  end
end
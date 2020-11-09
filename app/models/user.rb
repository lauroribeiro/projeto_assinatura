class User < ApplicationRecord
  # after_update :set_state
  belongs_to :request
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :email, presence: true, format: {with: EMAIL_REGEX}
  
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

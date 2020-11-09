class UserMailer < ApplicationMailer
  default from: "naoresponda@empresa.com"

  def notify_email(user)
    @user = user
    @url = "#{Rails.root}#{Request.find(user.request_id).attachment}"
    mail(to: @user.email, subject: "Solicitação de Assinatura")
  end
end
# ActiveRecord::Base.connection.execute("TRUNCATE TABLE your_table_name RESTART IDENTITY")
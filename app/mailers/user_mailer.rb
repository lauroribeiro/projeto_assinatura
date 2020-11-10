class UserMailer < ApplicationMailer
  default from: "naoresponda@empresa.com"

  def notify_email(user)
    @user = user
    @url = "#{Rails.root}/user/#{@user.id}/edit}"
    # @url = "#{Rails.root}#{edit_user_path(@user)}"
    mail(to: @user.email, subject: "Solicitação de Assinatura")
  end
end
# ActiveRecord::Base.connection.execute("TRUNCATE TABLE your_table_name RESTART IDENTITY")
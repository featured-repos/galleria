class UserMailer < ApplicationMailer

  def signup(user)
    @user = user
    mail(to: user.email, subject: "Welcome to Show Me What You Got")
  end

end

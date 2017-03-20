class PhotoMailer < ApplicationMailer

  def share(photo, send_to)
    @photo = photo
    mail(to: send_to, subject: "Check out this photo from Show Me What You Got")
  end

end

class GalleryMailer < ApplicationMailer

  def share(gallery, send_to)
    @gallery = gallery
      mail(to: send_to, subject: "Check out this gallery from Show Me What You Got")
  end

end

class ImageurlMailer < ApplicationMailer
  default subject: 'Somebody shared an image with you!'

  def shareimage_email
    @share = params[:share]
    mail to: @share.to, from: @share.from do |format|
      format.text
      format.html
    end
  end
end

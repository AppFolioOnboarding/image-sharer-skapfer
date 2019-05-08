class ImageurlSharesController < ApplicationController
  def new
    params = self.params.permit(:imageurl_id, :to, :from, :message)
    @imageurl_share = ImageurlShare.new(params)
    @imageurl_share.message ||= 'Enter a friendly message here...'

    head :not_found unless @imageurl_share.valid_imageurl_id?
  end

  def create
    params = self.params.permit(imageurl_share: %i[imageurl_id to from message])
    @imageurl_share = ImageurlShare.new(params[:imageurl_share])

    unless @imageurl_share.valid_imageurl_id?
      head :not_found
      return
    end

    unless ENV['SENDGRID_PASSWORD']
      head :service_unavailable
      return
    end

    unless @imageurl_share.valid?
      flash[:danger] = @imageurl_share.errors.full_messages.join(' ')
      render 'new', status: :unprocessable_entity
      return
    end

    ImageurlMailer.with(@imageurl_share.to_hash).shareimage_email.deliver_later
    flash[:success] = 'email sent successfully'
    redirect_to imageurls_path
  end
end

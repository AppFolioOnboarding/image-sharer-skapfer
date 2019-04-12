class ImageurlSharesController < ApplicationController
  def new
    params = self.params.permit(:imageurl_id, :to, :from, :message)
    @imageurl_share = ImageurlShare.new(params)
    @imageurl_share.message ||= 'Enter a friendly message here...'
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def create
    params = self.params.permit(imageurl_share: %i[imageurl_id to from message])
    @imageurl_share = ImageurlShare.new(params[:imageurl_share])
    if @imageurl_share.valid?
      ImageurlMailer.with(share: @imageurl_share).shareimage_email.deliver_now
      flash[:success] = 'email sent successfully'
      redirect_to imageurls_path
    else
      render 'new', status: :unprocessable_entity
    end
  end
end

class ImageurlSharesController < ApplicationController
  def new
    setup_form
  rescue ActiveRecord::RecordNotFound
    head :not_found
  end

  def create
    share = ImageurlShare.new(imageurl_share_params)
    if share.valid?
      ImageurlMailer.with(share: share).shareimage_email.deliver_now
      flash[:success] = 'email sent successfully'
      redirect_to imageurls_path
    else
      flash[:danger] = share.errors.full_messages.join('; ')
      setup_form
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def imageurl_share_params
    params.permit(:imageurl_id,:to, :from, :message)
  end

  def setup_form
    params = imageurl_share_params
    @imageurl = Imageurl.find(params[:imageurl_id])
    @message = params[:message] || 'Enter a friendly message here...'
    @to = params[:to]
    @from = params[:from]
  end
end
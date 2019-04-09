class ImageurlsController < ApplicationController
  def show
    @imageurl = Imageurl.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head 404
  end

  def new; end

  def create
    @imageurl = Imageurl.new(imageurl_params)
    if @imageurl.save
      flash[:success] = 'Image URL added successfully!'
      redirect_to @imageurl
    else
      flash[:danger] = @imageurl.errors.full_messages.join(' ')
      @formatted_tag_list = @imageurl.tag_list.join(', ')
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @number_of_urls = Imageurl.count
    @sorted_urls = Imageurl.order(created_at: :desc).limit(100)
  end

  private

  def imageurl_params
    params.require(:imageurl).permit(:url, :tag_list)
  end
end

class ImageurlsController < ApplicationController
  def show
    begin
      @imageurl = Imageurl.find(params[:id])
    rescue
      head 404
    end
  end

  def new; end

  def create
    @imageurl = Imageurl.new(params.require(:imageurl).permit(:url))
    if @imageurl.valid? && @imageurl.save
      flash[:success] = 'Image URL added successfully!'
      redirect_to @imageurl
    else
      flash[:error] = @imageurl.errors.full_messages.join(' ')
      render 'new', status: :unprocessable_entity
    end
  end
end

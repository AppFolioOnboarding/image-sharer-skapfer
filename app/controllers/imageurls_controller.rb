class ImageurlsController < ApplicationController
  def initialize
    ActiveSupport::Inflector.inflections do |inflect|
      inflect.irregular 'is', 'are'
    end
  end

  def show
    @imageurl = Imageurl.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    head 404
  end

  def new; end

  def create
    @imageurl = Imageurl.new(params.require(:imageurl).permit(:url))
    if @imageurl.valid? && @imageurl.save
      flash[:success] = 'Image URL added successfully!'
      redirect_to @imageurl
    else
      flash[:danger] = @imageurl.errors.full_messages.join(' ')
      render 'new', status: :unprocessable_entity
    end
  end

  def index
    @number_of_urls = Imageurl.count
    @sorted_urls = Imageurl.order(created_at: :desc).limit(100)
  end
end

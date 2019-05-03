class ImageurlShare
  include ActiveModel::Model
  attr_accessor :to, :from, :message, :imageurl_id
  validates :to, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'recipient email address is invalid'
  }
  validates :from, format: {
    with: URI::MailTo::EMAIL_REGEXP,
    message: 'sender email address is invalid'
  }
  validates :imageurl_id, presence: true
  validate :imageurl_id_valid

  def imageurl
    Imageurl.find(imageurl_id)
  end

  def valid_imageurl_id?
    Imageurl.where(id: imageurl_id).exists?
  end

  private

  def imageurl_id_valid
    errors.add(:imageurl_id, 'invalid id') unless valid_imageurl_id?
  end
end

class ImageurlShare
  include ActiveModel::Model
  attr_accessor :to, :from, :message, :imageurl_id
  validates :to, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :from, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :imageurl_id, presence: true
  validate :imageurl_id_valid

  def imageurl
    Imageurl.find(imageurl_id)
  end

  private

  def imageurl_id_valid
    imageurl
  rescue ActiveRecord::RecordNotFound
    errors.add(:imageurl_id, 'invalid id')
  end
end

class ImageurlShare
  include ActiveModel::Model
  attr_accessor :to, :from, :message, :imageurl_id
  validates :to, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :from, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :imageurl_id, presence: true
  validate :imageurl_id_valid

  private

  def imageurl_id_valid
    Imageurl.find(imageurl_id)
    true
  rescue ActiveRecord::RecordNotFound
    errors.add(:imageurl_id, 'invalid id')
    false
  end
end

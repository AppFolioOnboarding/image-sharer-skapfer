require 'test_helper'

class ImageurlShareTest < ActiveSupport::TestCase
  valid_email = 'foo@example.com'
  invalid_email = 'foo.example.com'

  test 'URL share with invalid URL id is invalid' do
    Imageurl.delete_all
    share = ImageurlShare.new(to: valid_email, from: valid_email, imageurl_id: 1)
    assert_not share.valid?
  end

  test 'URL share with invalid to email is invalid' do
    share = ImageurlShare.new(to: invalid_email, from: valid_email, imageurl_id: valid_id)
    assert_not share.valid?
    assert_includes share.errors[:to], 'is invalid'
  end

  test 'URL share with invalid from email is invalid' do
    share = ImageurlShare.new(to: valid_email, from: invalid_email, imageurl_id: valid_id)
    assert_not share.valid?
    assert_includes share.errors[:from], 'is invalid'
  end

  test 'valid URL share is valid' do
    share = ImageurlShare.new(to: valid_email, from: valid_email, imageurl_id: valid_id)
    assert share.valid?
  end

  private

  def valid_id
    Imageurl.create!(url: 'https://host.com/aloha.png').id
  end
end

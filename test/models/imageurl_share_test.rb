require 'test_helper'

class ImageurlShareTest < ActiveSupport::TestCase
  def setup
    @valid_email = 'foo@example.com'
    @invalid_email = 'foo.example.com'
    Imageurl.delete_all
    @valid_id = Imageurl.create!(url: 'https://host.com/aloha.png').id
    @invalid_id = @valid_id + 1
  end

  test 'URL share with invalid URL id is invalid' do
    share = ImageurlShare.new(to: @valid_email, from: @valid_email, imageurl_id: @invalid_id)
    assert_not share.valid?
  end

  test 'URL share with invalid to email is invalid' do
    share = ImageurlShare.new(to: @invalid_email, from: @valid_email, imageurl_id: @valid_id)
    assert_not share.valid?
    assert_includes share.errors[:to], 'is invalid'
  end

  test 'URL share with invalid from email is invalid' do
    share = ImageurlShare.new(to: @valid_email, from: @invalid_email, imageurl_id: @valid_id)
    assert_not share.valid?
    assert_includes share.errors[:from], 'is invalid'
  end

  test 'valid URL share is valid' do
    share = ImageurlShare.new(to: @valid_email, from: @valid_email, imageurl_id: @valid_id)
    assert share.valid?
  end
end

require 'test_helper'

class ImageurlTest < ActiveSupport::TestCase
  test 'image URL beginning with http is valid' do
    url = Imageurl.new(url: 'http://host.com/aloha.png')
    assert url.valid?
  end

  test 'image URL beginning with https is valid' do
    url = Imageurl.new(url: 'https://host.com/aloha.png')
    assert url.valid?
  end

  test 'image URL with other url is invalid' do
    url = Imageurl.new(url: 'foobar')
    assert_not url.valid?
    assert_includes url.errors[:url], 'must begin with http:// or https://'
  end

  test 'image URL without url is invalid' do
    url = Imageurl.new
    assert_not url.valid?
    assert_includes url.errors[:url], 'can\'t be blank'
    url = Imageurl.new(url: nil)
    assert_not url.valid?
    assert_includes url.errors[:url], 'can\'t be blank'
  end
end

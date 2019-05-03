require 'test_helper'

class ImageurlSharesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imageurl = Imageurl.create!(url: 'http://host.com/image.jpg', created_at: Time.current)
    @sharing_path = "/imageurls/#{@imageurl.id}/share"
    ENV['SENDGRID_PASSWORD'] = 'password'
  end

  test 'new share' do
    get @sharing_path
    assert_response :success
    assert_template 'new'
  end

  test 'new share, 404 on invalid id' do
    get '/imageurls/no_such_id/share'
    assert_response :not_found
  end

  test 'sharing' do
    post @sharing_path, params: {
      imageurl_share: {
        imageurl_id: @imageurl.id,
        to: 'foo@bar.com', from: 'foo@bar.com',
        message: 'blah'
      }
    }
    assert_redirected_to imageurls_path
    assert_equal 'email sent successfully', flash[:success]
  end

  test 'sharing: returns to form on error' do
    post @sharing_path, params: {
      imageurl_share: {
        imageurl_id: @imageurl.id,
        from: 'foo@bar.com',
        message: 'blah'
      }
    }
    assert_response :unprocessable_entity
    assert_template 'new'
    assert_equal 'To recipient email address is invalid', flash[:danger]
  end

  test 'sharing:  HTTP 404 if invalid ' do
    post @sharing_path, params: {
      imageurl_share: {
        imageurl_id: 'invalid_id',
        to: 'foo@bar.com', from: 'foo@bar.com',
        message: 'blah'
      }
    }
    assert_response 404
  end

  test 'sharing:  HTTP 503 if SendGrid unconfigured' do
    ENV['SENDGRID_PASSWORD'] = nil
    post @sharing_path, params: {
      imageurl_share: {
        imageurl_id: @imageurl.id,
        to: 'foo@bar.com', from: 'foo@bar.com',
        message: 'blah'
      }
    }
    assert_response 503
  end
end

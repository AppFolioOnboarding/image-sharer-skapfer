require 'test_helper'

class ImageurlsControllerTest < ActionDispatch::IntegrationTest
  test 'should respond to /imageurls/new' do
    get '/imageurls/new'
    assert_response :success
  end

  test 'creating a new URL works' do
    assert_difference('Imageurl.count') do
      post '/imageurls', params: { imageurl: { url: 'http://host.com/image.jpg' }}
      assert_redirected_to Imageurl.last
      # check new record can be shown
      get imageurl_path(Imageurl.first)
      assert_response :success
    end
  end

  test 'showing invalid id fails' do
    get '/imageurls/%i' % [Imageurl.last.id + 1]
    assert_response :not_found
  end

  test 'creating an invalid URL fails' do
    post '/imageurls', params: { imageurl: { url: 'foobar' }}
    assert_response :unprocessable_entity
  end
end

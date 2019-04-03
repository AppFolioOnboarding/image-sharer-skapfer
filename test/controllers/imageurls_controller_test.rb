require 'test_helper'

class ImageurlsControllerTest < ActionDispatch::IntegrationTest
  test 'should respond to /imageurls/new' do
    get '/imageurls/new'
    assert_response :success
    assert_template 'new'
  end

  test 'creating a new URL works' do
    # FIXME check correct flash message is shown
    assert_difference('Imageurl.count') do
      post '/imageurls', params: { imageurl: { url: 'http://host.com/image.jpg' } }
      assert_redirected_to Imageurl.last
      assert_template nil
    end
  end

  test 'showing valid id succeeds' do
    url = Imageurl.new(url: 'http://host.com/image.jpg')
    assert url.save
    get imageurl_url(url)
    assert_response :success
    assert_template 'show'
  end

  test 'showing invalid id fails' do
    post '/imageurls', params: { imageurl: { url: 'http://host.com/image.jpg' } }
    get format('/imageurls/%<id>i', id: Imageurl.last.id + 1)
    assert_response :not_found
    assert_template nil
  end

  test 'creating an invalid URL fails' do
    post '/imageurls', params: { imageurl: { url: 'foobar' } }
    # FIXME check correct flash message is shown
    assert_response :unprocessable_entity
    assert_template 'new'
  end
end

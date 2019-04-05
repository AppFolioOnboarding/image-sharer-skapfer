require 'test_helper'

class ImageurlsControllerTest < ActionDispatch::IntegrationTest
  test 'should respond to /imageurls/new' do
    get '/imageurls/new'
    assert_response :success
    assert_template 'new'
  end

  test 'creating a new URL works' do
    assert_difference('Imageurl.count') do
      post '/imageurls', params: { imageurl: { url: 'http://host.com/image.jpg' } }
    end
    assert_redirected_to Imageurl.last
    assert_equal 'Image URL added successfully!', flash[:success]
    assert_template nil
  end

  test 'showing valid id succeeds' do
    url = Imageurl.create!(url: 'http://host.com/image.jpg')
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
    assert_response :unprocessable_entity
    assert_equal 'Url must begin with http:// or https://', flash[:danger]
    assert_template 'new'
  end

  test 'showing index succeeds' do
    # make sure there's something in the DB to index
    Imageurl.create!(url: 'http://host.com/image.jpg')
    get '/imageurls/'
    assert_response :success
    assert_template 'index'
  end
end

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

  test 'showing index succeeds and images are sorted' do
    # make sure there's something in the DB to index
    Imageurl.create!(url: 'http://host.com/image.jpg', created_at: 0)
    Imageurl.create!(url: 'http://host.com/image.jpg', created_at: 1)
    get '/imageurls/'
    assert_response :success
    assert_template 'index'
    # FIXME: prettier way to get instance variables of the controller?
    assert descending? @controller.instance_variable_get('@sorted_urls').map(&:created_at)
  end

  test 'showing index succeeds when DB is empty' do
    Imageurl.delete_all
    get '/imageurls/'
    assert_response :success
    assert_template 'index'
  end

  private

  def descending?(array)
    array.each_cons(2) { |lhs, rhs| return false unless lhs >= rhs }
    true
  end
end

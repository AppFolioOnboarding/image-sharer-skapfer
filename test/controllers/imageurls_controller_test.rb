require 'test_helper'

class ImageurlsControllerTest < ActionDispatch::IntegrationTest
  valid_url = 'http://host.com/image.jpg'

  test 'should respond to /imageurls/new' do
    get '/imageurls/new'
    assert_response :success
    assert_template 'new'
  end

  test 'creating a new URL works' do
    assert_difference('Imageurl.count') do
      post '/imageurls', params: { imageurl: { url: valid_url, tag_list: '' } }
    end
    assert_redirected_to Imageurl.last
    assert_equal 'Image URL added successfully!', flash[:success]
    assert_template nil
  end

  test 'creating a URL with valid tag succeeds' do
    post '/imageurls', params: { imageurl: { url: valid_url, tag_list: 'foobar' } }
    assert_redirected_to Imageurl.last
    assert_equal 'Image URL added successfully!', flash[:success]
    assert_template nil
  end

  test 'showing valid id succeeds and shows tags, alphabetically sorted' do
    url = Imageurl.create!(url: valid_url, tag_list: 'cat, act, tac')
    get imageurl_url(url)
    assert_response :success
    assert_template 'show'
    assert_select 'div.tag_list', 'act, cat, tac'
  end

  test 'showing invalid id fails' do
    post '/imageurls', params: { imageurl: { url: valid_url, tag_list: '' } }
    get format('/imageurls/%<id>i', id: Imageurl.last.id + 1)
    assert_response :not_found
    assert_template nil
  end

  test 'creating an invalid URL fails' do
    post '/imageurls', params: { imageurl: { url: 'foobar', tag_list: '' } }
    assert_response :unprocessable_entity
    assert_equal 'Url must begin with http:// or https://', flash[:danger]
    assert_template 'new'
  end

  test 'creating a URL with invalid tag fails' do
    post '/imageurls', params: { imageurl: { url: valid_url, tag_list: 'foo bar' } }
    assert_response :unprocessable_entity
    assert_equal 'Tag list tags must be lowercase ASCII strings and cannot contain spaces', flash[:danger]
    assert_template 'new'
  end

  test 'showing index succeeds and images are sorted' do
    Imageurl.delete_all
    Imageurl.create!(url: valid_url, created_at: Time.current)
    Imageurl.create!(url: valid_url, created_at: Time.current + 5.minutes)
    get '/imageurls/'
    assert_response :success
    assert_template 'index'
    assert descending? assigns(:sorted_urls).map(&:created_at)
    assert_equal 2, css_select('img.thumbnail').length
  end

  test 'showing index succeeds when DB is empty' do
    Imageurl.delete_all
    get '/imageurls/'
    assert_response :success
    assert_template 'index'
    assert css_select('img.thumb').empty?
  end

  private

  def descending?(array)
    array.each_cons(2) { |lhs, rhs| return false unless lhs >= rhs }
    true
  end
end

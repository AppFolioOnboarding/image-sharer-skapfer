require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'should respond to /' do
    get '/'
    assert_response :success
    assert_template 'index'
  end
end

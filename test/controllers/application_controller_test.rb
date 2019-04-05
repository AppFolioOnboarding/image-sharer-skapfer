require 'test_helper'

class ApplicationControllerTest < ActionDispatch::IntegrationTest
  test 'should respond to /' do
    get '/'
    assert_response :temporary_redirect
    assert_redirected_to '/imageurls'
  end
end

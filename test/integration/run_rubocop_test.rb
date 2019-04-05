require 'test_helper'

class RunRubocop < ActionDispatch::IntegrationTest
  test 'code must be Rubocop clean/' do
    assert system('bundle exec rubocop')
  end
end

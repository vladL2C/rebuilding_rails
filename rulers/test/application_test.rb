require_relative "test_helper"

class TestApp < Rulers::Application
end

class RulersAppTest < Minitest::Test
  include Rack::Test::Methods
  def app
    TestApp.new
  end

  def test_request
    get "/"
    assert(last_response.ok?)
    body = last_response.body
    assert(body["Hello"])
  end

  def test_includes_rulers
    get "/"
    body = last_response.body
    assert(body["Rulers"])
  end
end

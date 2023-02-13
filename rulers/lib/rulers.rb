# frozen_string_literal: true

require_relative "rulers/version"
require "rulers/array"
require "rulers/routing"
require "rulers/util"
require "rulers/dependencies"
require "rulers/controller"

module Rulers
  class Application
    PATH_INFO = "PATH_INFO"
    CONTENT_TYPE = {"Content-Type" => "text/html"}
    def call(env)
      if env[PATH_INFO] == "/favicon.ico"
        return [404,
          CONTENT_TYPE, []]
      end

      # root path
      if env[PATH_INFO] == "/"
        return [301,
          {**CONTENT_TYPE, "Location" => "/quotes/a_quote"}, []]
      end

      klass, act = get_controller_and_action(env)
      controller = klass.new(env)

      begin
        text = controller.send(act)
      rescue
        text = "oooops someting fialed"
      end

      [200, CONTENT_TYPE,
        [text]]
    end
  end
end

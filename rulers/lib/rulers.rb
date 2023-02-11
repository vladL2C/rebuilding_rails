# frozen_string_literal: true

require_relative "rulers/version"
require "rulers/array"
require "rulers/routing"

module Rulers
  class Application
    def call(env)
      klass, act = get_controller_and_action(env)
      controller = klass.new(env)
      `echo debug > debug.txt`
      [200, {"Content-Type" => "text/html"},
        ["Hello from Ruby on Rulers!"]]
    end
  end

  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end
  end
end

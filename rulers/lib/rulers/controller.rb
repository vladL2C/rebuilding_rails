require "erubis"
require "rulers/file_model"

module Rulers
  class Controller
    include Rulers::Model
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(view_name, locals = {})
      filename = File.join("app", "views", controller_name, "#{view_name}.html.erb")
      template = File.read(filename)

      eruby = Erubis::Eruby.new(template)

      eruby.result(locals.merge(**get_instance_variables, controller_name: controller_name, env: @env))
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub(/Controller$/, "")
      Rulers.to_underscore(klass)
    end

    private

    def get_instance_variables
      instance_variables.each_with_object({}) { |variable, variables| variables[variable] = instance_variable_get(variable) }
    end
  end
end

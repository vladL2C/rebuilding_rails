require "erubis"

module Rulers
  class Controller
    attr_reader :env

    def initialize(env)
      @env = env
    end

    def render(view_name, locals = {})
      filename = File.join("app", "views", controller_name, "#{view_name}.html.erb")
      template = File.read(filename)

      eruby = Erubis::Eruby.new(template)

      eruby.result(locals.merge(controller_name: controller_name, env: @env, **get_instance_variables))
    end

    def controller_name
      klass = self.class
      klass = klass.to_s.gsub(/Controller$/, "")
      Rulers.to_underscore(klass)
    end

    def get_instance_variables
      self
        .class
        .instance_variables.each_with_object({}) { |variable, variables| variables[variable] = instance_variable_get(variable) }
    end
  end
end

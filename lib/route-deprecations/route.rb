module RouteDeprecations
  module Route
    def self.included base
      base.class_eval do
        alias_method_chain :initialize, :route_deprecations
        alias_method_chain :write_recognition!, :route_deprecations
      end
    end

    def initialize_with_route_deprecations(segments = [], requirements = {}, conditions = {})
      @deprecated      = requirements.delete(:deprecated)
      @definition_line = caller.find { |l| l.to_s.include? 'config/routes.rb:' }
      initialize_without_deprecation_support(segments, requirements, conditions)
    end

    def write_recognition_with_route_deprecations!
      # Create an if structure to extract the params from a match if it occurs.
      body = ''
      if deprecated?
        deprecation_message = "This route is deprecated: #{to_s.gsub(/ +/, ' ')}"
        body += "\n::ActiveSupport::Deprecation.warn(#{deprecation_message.inspect}, [@definition_line])\n"
      end
      body += "params = parameter_shell.dup\n#{recognition_extraction * "\n"}\nparams"
      body = "if #{recognition_conditions.join(" && ")}\n#{body}\nend"

      # Build the method declaration and compile it
      method_decl = "def recognize(path, env = {})\n#{body}\nend"
      instance_eval method_decl, "generated code (#{__FILE__}:#{__LINE__})"
      method_decl
    end

    attr_reader :deprecated
    alias deprecated? deprecated
  end
end

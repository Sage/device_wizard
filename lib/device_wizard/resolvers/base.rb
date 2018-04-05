# frozen_string_literal: true

module DeviceWizard
  module Resolvers
    class Base
      def get_version(user_agent)
        user_agent.downcase!
        result = UNKNOWN
        result = $1 if self.class::REGEX =~ user_agent
      end

      def identify(user_agent)
        user_agent.downcase!

        return unless user_agent.include? self.class::KEYWORD

        result = details_klass.new
        result.name = self.class::NAME
        result.version = get_version(user_agent)
        result
      end

      def details_klass
        raise NotImplementedError
      end
    end
  end
end

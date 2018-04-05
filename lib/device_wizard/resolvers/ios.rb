# frozen_string_literal: true

module DeviceWizard
  module Resolvers
    class IOS < Base
      NAME = 'IOS'
      IPHONE = 'iphone'
      IPAD = 'ipad'
      IPOD = 'ipod'
      REGEX = Regexp.new('os ((\d+_?){2,3})\s')

      def get_version(user_agent)
        result = super(user_agent)
        result.gsub('_','.')
      end

      def get_type(user_agent)
        user_agent.downcase!

        return 'IPod' if user_agent.include? IPOD
        return 'IPad' if user_agent.include? IPAD
        return 'IPhone' if user_agent.include? IPHONE
        return UNKNOWN
      end

      def identify(user_agent)
        user_agent.downcase!

        return unless [IPHONE, IPAD, IPOD].any? { |i| user_agent.include? i }

        result = details_klass.new
        result.name = NAME
        result.type = get_type(user_agent)
        result.version = get_version(user_agent)
        return result
      end

      def details_klass
        Details::OperatingSystem
      end
    end
  end
end

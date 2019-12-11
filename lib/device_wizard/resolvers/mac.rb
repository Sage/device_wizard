# frozen_string_literal: true

module DeviceWizard
  module Resolvers
    class Mac < Base
      NAME = 'Mac OSX'
      KEYWORD = 'intel mac os x'
      REGEX = Regexp.new('(intel mac os x (?:[0-9]+[._]?){1,3})')

      def get_version(user_agent)
        result = super(user_agent)
        result.gsub('_','.')
      end

      def details_klass
        Details::OperatingSystem
      end
    end
  end
end

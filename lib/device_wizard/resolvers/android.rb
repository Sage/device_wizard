# frozen_string_literal: true

module DeviceWizard
  module Resolvers
    class Android < Base
      NAME = 'Android'
      KEYWORD = 'android'
      REGEX = Regexp.new('android (\d+(?:\.\d+)+)')

      def details_klass
        Details::OperatingSystem
      end
    end
  end
end

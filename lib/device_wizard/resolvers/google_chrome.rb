# frozen_string_literal: true

module DeviceWizard
  module Resolvers
    class GoogleChrome < Base
      NAME = 'Google Chrome'
      KEYWORD = 'chrome'
      REGEX = Regexp.new('chrome/([0-9]+.[0-9]+.[0-9]+.[0-9])')

      def details_klass
        Details::Browser
      end
    end
  end
end

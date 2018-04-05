# frozen_string_literal: true

module DeviceWizard
  module Resolvers
    require 'device_wizard/resolvers/base'

    class Firefox < Base
      NAME = 'Firefox'
      KEYWORD = 'firefox'
      REGEX = Regexp.new('firefox/([0-9]+.[0-9])')

      def details_klass
        Details::Browser
      end
    end
  end
end

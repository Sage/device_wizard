# frozen_string_literal: true

module DeviceWizard
  module Resolvers
    class Safari < Base
      NAME = 'Safari'
      KEYWORD = 'safari'
      REGEX = Regexp.new('safari/([\.0-9]{3,})')

      def details_klass
        Details::Browser
      end
    end
  end
end

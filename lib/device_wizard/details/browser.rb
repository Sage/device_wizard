# frozen_string_literal: true

module DeviceWizard
  module Details
    class Browser
      attr_accessor :name
      attr_accessor :version

      def initialize
        @name = UNKNOWN
        @version = UNKNOWN
      end
    end
  end
end

# frozen_string_literal: true

module DeviceWizard
  module Resolvers
    class Windows < Base
      NAME = 'Windows'
      KEYWORD = 'windows nt'
      REGEX = Regexp.new('windows nt ([0-9]{1,}[\.0-9]{0,})')
      NTVERSION = [ '4.0', '5.0', '5.01', '5.1', '5.2', '6.0', '6.1', '6.2', '6.3' ]
      NTNAME = [ 'NT 4.0', '2000', '2000 SP1', 'XP', 'XP x64', 'Vista', '7', '8', '8.1' ]

      def get_version(user_agent)
        user_agent.downcase!
        result = UNKNOWN

        if REGEX =~ user_agent
          if NTVERSION.index($1)
            result = NTNAME[NTVERSION.index($1)]
          else
            result = $1
          end
        end
      end

      def details_klass
        Details::OperatingSystem
      end
    end
  end
end

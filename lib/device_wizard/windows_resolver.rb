module DeviceWizard
  class WindowsResolver
    KEYWORD = 'windows nt'
    REGEX = Regexp.new('windows nt ([0-9]{1,}[\.0-9]{0,})')
    NTVERSION = [ '4.0', '5.0', '5.01', '5.1', '5.2', '6.0', '6.1', '6.2', '6.3' ]
    NTNAME    = [ 'NT 4.0', '2000', '2000 SP1', 'XP', 'XP x64', 'Vista', '7', '8', '8.1' ]

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

    def identify(user_agent)
      user_agent.downcase!

      return unless user_agent.include? KEYWORD

      result = OperatingSystemDetails.new
      result.name = 'Windows'
      result.version = get_version(user_agent)
      result
    end
  end
end

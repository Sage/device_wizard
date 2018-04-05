module DeviceWizard
  class MacResolver
    KEYWORD = 'intel mac os x'
    REGEX = Regexp.new('intel mac os x ([0-9]+_[0-9])')

    def get_version(user_agent)
      user_agent.downcase!
      result = UNKNOWN

      result = $1 if REGEX =~ user_agent

      result.gsub('_','.')
    end

    def identify(user_agent)
      user_agent.downcase!

      return unless user_agent.include? KEYWORD

      result = OperatingSystemDetails.new
      result.name = 'Mac OSX'
      result.version = get_version(user_agent)
      result
    end
  end
end

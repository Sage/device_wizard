module DeviceWizard
  class AndroidResolver
    KEYWORD = 'android'
    REGEX = Regexp.new('android (\d+(?:\.\d+)+)')

    def get_version(user_agent)
      user_agent.downcase!
      result = UNKNOWN
      result = $1 if REGEX =~ user_agent
    end

    def identify(user_agent)
      user_agent.downcase!

      return unless user_agent.include? KEYWORD

      result = OperatingSystemDetails.new
      result.name = 'Android'
      result.version = get_version(user_agent)
      result
    end
  end
end

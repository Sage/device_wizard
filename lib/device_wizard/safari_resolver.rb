module DeviceWizard
  class SafariResolver
    KEYWORD = 'safari'
    REGEX = Regexp.new('safari/([\.0-9]{3,})')

    def get_version(user_agent)
      user_agent.downcase!
      result = UNKNOWN

      result = $1 if REGEX =~ user_agent
    end

    def identify(user_agent)
      user_agent.downcase!

      return unless user_agent.include? KEYWORD

      result = BrowserDetails.new
      result.name = 'Safari'
      result.version = get_version(user_agent)
      result
    end
  end
end

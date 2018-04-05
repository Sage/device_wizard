module DeviceWizard
  class InternetExplorerResolver
    KEYWORD = 'msie'
    KEYWORD2 = ' rv:'
    REGEX = Regexp.new('msie ([0-9]+.[0-9])')
    REGEX2 = Regexp.new('rv:([0-9]+.[0-9])')

    def get_version(user_agent)
      user_agent.downcase!
      result = UNKNOWN

      return result = $1 if REGEX =~ user_agent
      return result = $1 if REGEX2 =~ user_agent
    end

    def identify(user_agent)
      user_agent.downcase!

      unless user_agent.include? KEYWORD
        return unless user_agent.include? KEYWORD2
      end

      result = BrowserDetails.new
      result.name = 'Internet Explorer'
      result.version = get_version(user_agent)
      result
    end
  end
end

module DeviceWizard
  class UserAgentDetector

    #########
    ##CONST Keywords
    MOBILE = 'mobile'
    IPAD = 'ipad'
    IPHONE = 'iphone'
    ANDROID = 'android'
    TABLET = 'tablet'
    SILK = 'silk'
    #########

    #########
    ##CONST Regex Patterns
    #########
    REGEX_OS = /(windows|linux|os\s+[x9]|solaris|bsd)/
    REGEX_MOBILE = /(iphone|ipod|blackberry|android|palm|windows\s+ce|mobile|symbian|phone)/
    REGEX_CRAWLER = /(spider|crawl|slurp|bot)/
    #########

    def initialize
      @browser_resolvers = []
      @browser_resolvers.push(FirefoxResolver.new)
      @browser_resolvers.push(GoogleChromeResolver.new)
      @browser_resolvers.push(InternetExplorerResolver.new)
      @browser_resolvers.push(SafariResolver.new)

      @os_resolvers = []
      @os_resolvers.push(AndroidResolver.new)
      @os_resolvers.push(IOSResolver.new)
      @os_resolvers.push(MacResolver.new)
      @os_resolvers.push(WindowsResolver.new)
    end

    def unknown
      UNKNOWN
    end

    def get_device_type(user_agent)

      if user_agent.to_s.strip.length == 0
        return DeviceType::UNKNOWN
      end

      user_agent.downcase!

      if user_agent.include? TABLET
        return DeviceType::TABLET
      end

      if user_agent.include? MOBILE
        if user_agent.include? IPAD
          return DeviceType::TABLET
        else
          return DeviceType::MOBILE
        end
      elsif user_agent.include? ANDROID
        return DeviceType::TABLET
      end

      if REGEX_MOBILE =~ user_agent
        return DeviceType::MOBILE
      end

      if user_agent.include? SILK
        return DeviceType::TABLET
      end

      if REGEX_OS =~ user_agent
        return DeviceType::DESKTOP
      end

      if REGEX_CRAWLER =~ user_agent
        return DeviceType::CRAWLER
      end

      return DeviceType::UNKNOWN

    end

    def get_browser(user_agent)

      @browser_resolvers.each do |r|

        browser = r.identify(user_agent)

        if browser != nil
          return browser
        end

      end

      return BrowserDetails.new

    end

    def get_os(user_agent)

      @os_resolvers.each do |r|

        os = r.identify(user_agent)

        if os != nil
          return os
        end

      end

      return OperatingSystemDetails.new

    end

    def get_details(user_agent)
      details = DeviceDetails.new

      details.type = get_device_type(user_agent)
      details.browser = get_browser(user_agent)
      details.os = get_os(user_agent)

      return details
    end

  end
end

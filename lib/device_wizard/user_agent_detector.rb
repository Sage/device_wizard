# frozen_string_literal: true

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
      @browser_resolvers.push(Resolvers::Firefox.new)
      @browser_resolvers.push(Resolvers::GoogleChrome.new)
      @browser_resolvers.push(Resolvers::InternetExplorer.new)
      @browser_resolvers.push(Resolvers::Safari.new)

      @os_resolvers = []
      @os_resolvers.push(Resolvers::Android.new)
      @os_resolvers.push(Resolvers::IOS.new)
      @os_resolvers.push(Resolvers::Mac.new)
      @os_resolvers.push(Resolvers::Windows.new)
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

      DeviceType::UNKNOWN
    end

    def get_browser(user_agent)
      @browser_resolvers.each do |r|
        browser = r.identify(user_agent)
        return browser unless browser.nil?
      end

      Details::Browser.new
    end

    def get_os(user_agent)
      @os_resolvers.each do |r|
        os = r.identify(user_agent)
        return os unless os.nil?
      end

      Details::OperatingSystem.new
    end

    def get_details(user_agent)
      details = Details::Device.new

      details.type = get_device_type(user_agent)
      details.browser = get_browser(user_agent)
      details.os = get_os(user_agent)

      details
    end
  end
end

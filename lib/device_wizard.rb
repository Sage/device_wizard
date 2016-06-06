require "device_wizard/version"

module DeviceWizard

  UNKNOWN = 'Unknown'.freeze

  class DeviceType
    DESKTOP='desktop'
    TABLET='tablet'
    MOBILE='mobile'
    CRAWLER='crawler'
    UNKNOWN='unknown'
  end

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

  class DeviceDetails
    attr_accessor :type
    attr_accessor :browser
    attr_accessor :os
  end

  class BrowserDetails
    attr_accessor :name
    attr_accessor :version

    def initialize
      @name = UNKNOWN
      @version = UNKNOWN
    end
  end

  class FirefoxResolver

    KEYWORD = 'firefox'
    REGEX = Regexp.new('firefox/([0-9]+.[0-9])')

    def get_version(user_agent)
      user_agent.downcase!
      result = UNKNOWN

      if REGEX =~ user_agent
        result = $1
      end
    end

    def identify(user_agent)
      user_agent.downcase!

      if !user_agent.include? KEYWORD
        return nil
      end

      result = BrowserDetails.new
      result.name = 'Firefox'
      result.version = get_version(user_agent)
      return result
    end
  end

  class GoogleChromeResolver

    KEYWORD = 'chrome'
    REGEX = Regexp.new('chrome/([0-9]+.[0-9]+.[0-9]+.[0-9])')

    def get_version(user_agent)
      user_agent.downcase!
      result = UNKNOWN

      if REGEX =~ user_agent
        result = $1
      end
    end

    def identify(user_agent)
      user_agent.downcase!

      if !user_agent.include? KEYWORD
        return nil
      end

      result = BrowserDetails.new
      result.name = 'Google Chrome'
      result.version = get_version(user_agent)
      return result
    end

  end

  class InternetExplorerResolver
    KEYWORD = 'msie'
    KEYWORD2 = ' rv:'
    REGEX = Regexp.new('msie ([0-9]+.[0-9])')
    REGEX2 = Regexp.new('rv:([0-9]+.[0-9])')

    def get_version(user_agent)
      user_agent.downcase!
      result = UNKNOWN

      if REGEX =~ user_agent
        return result = $1
      end
      if REGEX2 =~ user_agent
        return result = $1
      end
    end

    def identify(user_agent)
      user_agent.downcase!

      if !user_agent.include? KEYWORD
        if !user_agent.include? KEYWORD2
          return nil
        end
      end

      result = BrowserDetails.new
      result.name = 'Internet Explorer'
      result.version = get_version(user_agent)
      return result
    end

  end

  class SafariResolver

    KEYWORD = 'safari'
    REGEX = Regexp.new('safari/([\.0-9]{3,})')

    def get_version(user_agent)
      user_agent.downcase!
      result = UNKNOWN

      if REGEX =~ user_agent
        result = $1
      end
    end

    def identify(user_agent)
      user_agent.downcase!

      if !user_agent.include? KEYWORD
        return nil
      end

      result = BrowserDetails.new
      result.name = 'Safari'
      result.version = get_version(user_agent)
      return result
    end

  end

  class OperatingSystemDetails

    attr_accessor :name
    attr_accessor :type
    attr_accessor :version

  end

  class AndroidResolver

    KEYWORD = 'android'
    REGEX = Regexp.new('android (\d+(?:\.\d+)+)')

    def get_version(user_agent)
      user_agent.downcase!
      result = UNKNOWN

      if REGEX =~ user_agent
        result = $1
      end
    end

    def identify(user_agent)
      user_agent.downcase!

      if !user_agent.include? KEYWORD
        return nil
      end

      result = OperatingSystemDetails.new
      result.name = 'Android'
      result.version = get_version(user_agent)
      return result
    end

  end

  class IOSResolver

    IPHONE = 'iphone'
    IPAD = 'ipad'
    IPOD = 'ipod'
    REGEX = Regexp.new('os ((\d+_?){2,3})\s')

    def get_version(user_agent)
      user_agent.downcase!
      result = UNKNOWN

      if REGEX =~ user_agent
        result = $1
      end

      return result.gsub('_','.')
    end

    def get_type(user_agent)
      user_agent.downcase!

      if user_agent.include? IPOD
        return 'IPod'
      end

      if user_agent.include? IPAD
        return 'IPad'
      end

      if user_agent.include? IPHONE
        return 'IPhone'
      end

      return UNKNOWN
    end

    def identify(user_agent)
      user_agent.downcase!

      if !user_agent.include? IPHONE
        if !user_agent.include? IPAD
          if !user_agent.include? IPOD
            return nil
          end
        end
      end

      result = OperatingSystemDetails.new
      result.name = 'IOS'
      result.type = get_type(user_agent)
      result.version = get_version(user_agent)
      return result
    end

  end

  class MacResolver

    KEYWORD = 'intel mac os x'
    REGEX = Regexp.new('intel mac os x ([0-9]+_[0-9])')

    def get_version(user_agent)
      user_agent.downcase!
      result = UNKNOWN

      if REGEX =~ user_agent
        result = $1
      end

      return result.gsub('_','.')
    end

    def identify(user_agent)
      user_agent.downcase!

      if !user_agent.include? KEYWORD
        return nil
      end

      result = OperatingSystemDetails.new
      result.name = 'Mac OSX'
      result.version = get_version(user_agent)
      return result
    end

  end

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

      if !user_agent.include? KEYWORD
        return nil
      end

      result = OperatingSystemDetails.new
      result.name = 'Windows'
      result.version = get_version(user_agent)
      return result
    end

  end

end

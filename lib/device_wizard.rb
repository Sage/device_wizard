require "device_wizard/version"

module DeviceWizard

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

  end

end

module DeviceWizard
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
end

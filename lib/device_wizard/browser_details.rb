module DeviceWizard
  class BrowserDetails
    attr_accessor :name
    attr_accessor :version

    def initialize
      @name = UNKNOWN
      @version = UNKNOWN
    end
  end
end

require 'spec_helper'
require 'pry'
require 'device_wizard'

describe DeviceWizard::UserAgentDetector do

  context 'Browser' do

    it 'should correctly identify a firefox browser' do

      user_agent = "Mozilla/5.0 (Windows NT 5.1; rv:31.0) Gecko/20100101 Firefox/31.0";
      browser = subject.get_browser(user_agent)
      expect(browser.name).to eq('Firefox')
      expect(browser.version).to eq('31.0')
    end

    it 'should correctly identify a google chrome browser' do

      user_agent = "Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36"
      browser = subject.get_browser(user_agent)
      expect(browser.name).to eq('Google Chrome')
      expect(browser.version).to eq('37.0.2049.0')
    end

    it 'should correctly identify a ie8 browser' do

      user_agent = "Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB7.4; InfoPath.2; SV1; .NET CLR 3.3.69573; WOW64; en-US)"
      browser = subject.get_browser(user_agent)
      expect(browser.name).to eq('Internet Explorer')
      expect(browser.version).to eq('8.0')
    end

    it 'should correctly identify a ie9 browser' do

      user_agent = "Mozilla/5.0 (Windows; U; MSIE 9.0; WIndows NT 9.0; en-US))"
      browser = subject.get_browser(user_agent)
      expect(browser.name).to eq('Internet Explorer')
      expect(browser.version).to eq('9.0')
    end

    it 'should correctly identify a ie10 browser' do

      user_agent = "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)"
      browser = subject.get_browser(user_agent)
      expect(browser.name).to eq('Internet Explorer')
      expect(browser.version).to eq('10.0')

    end

    it 'should correctly identify a safari browser' do

      user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.13+ (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2"
      browser = subject.get_browser(user_agent)
      expect(browser.name).to eq('Safari')
      expect(browser.version).to eq('534.57.2')

    end

  end

end
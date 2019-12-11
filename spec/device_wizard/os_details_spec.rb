require 'spec_helper'

describe DeviceWizard::UserAgentDetector do

  context 'Operating System' do

    it 'should correctly identify a Windows Vista OS' do
      user_agent = 'Mozilla/5.0 (Windows NT 6.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36'
      os = subject.get_os(user_agent)
      expect(os.name).to eq('Windows')
      expect(os.version).to eq('Vista')
    end

    it 'should correctly identify a Windows 7 OS' do
      user_agent = 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36'
      os = subject.get_os(user_agent)
      expect(os.name).to eq('Windows')
      expect(os.version).to eq('7')
    end

    it 'should correctly identify a Windows 8 OS' do
      user_agent = 'Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36'
      os = subject.get_os(user_agent)
      expect(os.name).to eq('Windows')
      expect(os.version).to eq('8')
    end

    it 'should correctly identify a Windows 8.1 OS' do
      user_agent = 'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36'
      os = subject.get_os(user_agent)
      expect(os.name).to eq('Windows')
      expect(os.version).to eq('8.1')
    end

    it 'should correctly identify a IOS' do

      user_agent = "Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X; en-us) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53"
      os = subject.get_os(user_agent)
      expect(os.name).to eq('IOS')
      expect(os.version).to eq('7.0')
    end

    it 'should correctly identify a Android' do

      user_agent = "Mozilla/5.0 (Linux; Android 4.2.2; GT-I9195 Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.114 Mobile Safari/537.36"
      os = subject.get_os(user_agent)
      expect(os.name).to eq('Android')
      expect(os.version).to eq('4.2.2')
    end

    it 'should correctly identify a Mac OSX' do

      user_agent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.13+ (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2"
      os = subject.get_os(user_agent)
      expect(os.name).to eq('Mac OSX')
      expect(os.version).to eq('10.6.8')
    end

  end

end

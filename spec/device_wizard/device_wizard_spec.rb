require 'spec_helper'
require 'pry'
require 'device_wizard'

describe DeviceWizard::UserAgentDetector do

  context 'apple' do

    it 'should identify an iphone 4 as a mobile device' do
      expect(subject.get_device_type('Mozilla/5.0 (iPhone; U; CPU iPhone OS 4_2_1 like Mac OS X; en-us) AppleWebKit/533.17.9 (KHTML, like Gecko) Version/5.0.2 Mobile/8C148 Safari/6533.18.5')).to eq(DeviceWizard::DeviceType::MOBILE)
    end

    it 'should identify an iphone 5 as a mobile device' do
      expect(subject.get_device_type('Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B137 Safari/601.1')).to eq(DeviceWizard::DeviceType::MOBILE)
    end

    it 'should identify an iphone 6 as a mobile device' do
      expect(subject.get_device_type('Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1')).to eq(DeviceWizard::DeviceType::MOBILE)
    end

    it 'should identify an iphone 6 plus as a mobile device' do
      expect(subject.get_device_type('Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1')).to eq(DeviceWizard::DeviceType::MOBILE)
    end

    it 'should identify an ipad as a tablet device' do
      expect(subject.get_device_type('Mozilla/5.0 (iPad; CPU OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B137 Safari/601.1
x-client-data:CKa2yQEIxLbJAQj9lcoBCMOYygE=')).to eq(DeviceWizard::DeviceType::TABLET)
    end

    it 'should identify an ipad mini as a tablet device' do
      expect(subject.get_device_type('Mozilla/5.0 (iPad; CPU OS 7_0_4 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11B554a Safari/9537.53')).to eq(DeviceWizard::DeviceType::TABLET)
    end

  end

  context 'kindle' do

    it 'should identify an kindle fire xhd as a tablet device' do
      expect(subject.get_device_type('Mozilla/5.0 (Linux; U; en-us; KFAPWI Build/JDQ39) AppleWebKit/535.19 (KHTML, like Gecko) Silk/3.13 Safari/535.19 Silk-Accelerated=true')).to eq(DeviceWizard::DeviceType::TABLET)
    end

  end

  context 'blackberry' do

    it 'should identify a playbook as a tablet device' do
      expect(subject.get_device_type('Mozilla/5.0 (PlayBook; U; RIM Tablet OS 2.1.0; en-US) AppleWebKit/536.2+ (KHTML like Gecko) Version/7.2.1.0 Safari/536.2')).to eq(DeviceWizard::DeviceType::TABLET)
    end

  end

  context 'google' do

    it 'should identify a nexus 10 as a tablet device' do
      expect(subject.get_device_type('Mozilla/5.0 (Linux; Android 4.3; Nexus 10 Build/JSS15Q) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Safari/537.36')).to eq(DeviceWizard::DeviceType::TABLET)
    end

    it 'should identify a nexus 7 as a tablet device' do
      expect(subject.get_device_type('Mozilla/5.0 (Linux; Android 4.3; Nexus 7 Build/JSS15Q) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Safari/537.36')).to eq(DeviceWizard::DeviceType::TABLET)
    end

    it 'should identify a nexus 6 as a mobile device' do
      expect(subject.get_device_type('Mozilla/5.0 (Linux; Android 5.1.1; Nexus 6 Build/LYZ28E) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36')).to eq(DeviceWizard::DeviceType::MOBILE)
    end

  end

  context 'lg' do

    it 'should identify a lg optimus l70  as a mobile device' do
      expect(subject.get_device_type('Mozilla/5.0 (Linux; U; Android 4.4.2; en-us; LGMS323 Build/KOT49I.MS32310c) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/46.0.2490.76 Mobile Safari/537.36')).to eq(DeviceWizard::DeviceType::MOBILE)
    end

  end

  context 'samsung' do

    it 'should identify a galaxy s3 as a mobile device' do
      expect(subject.get_device_type('Mozilla/5.0 (Linux; U; Android 4.0; en-us; GT-I9300 Build/IMM76D) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30')).to eq(DeviceWizard::DeviceType::MOBILE)
    end

    it 'should identify a galaxy s4 as a mobile device' do
      expect(subject.get_device_type('Mozilla/5.0 (Linux; Android 4.2.2; GT-I9505 Build/JDQ39) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.76 Mobile Safari/537.36')).to eq(DeviceWizard::DeviceType::MOBILE)
    end

    it 'should identify a galaxy note 3 as a mobile device' do
      expect(subject.get_device_type('Mozilla/5.0 (Linux; U; Android 4.3; en-us; SM-N900T Build/JSS15J) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Mobile Safari/534.30')).to eq(DeviceWizard::DeviceType::MOBILE)
    end

  end

  context 'desktop' do

    context 'chrome' do

      it 'should identify a chrome browser on windows as a desktop device' do
        expect(subject.get_device_type('Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36')).to eq(DeviceWizard::DeviceType::DESKTOP)
      end

      it 'should identify a chrome browser on mac as a desktop device' do
        expect(subject.get_device_type('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36')).to eq(DeviceWizard::DeviceType::DESKTOP)
      end

    end

    context 'internet explorer' do

      it 'should identify a ie11 browser as a desktop device' do
        expect(subject.get_device_type('Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko')).to eq(DeviceWizard::DeviceType::DESKTOP)
      end

      it 'should identify a ie10 browser as a desktop device' do
        expect(subject.get_device_type('Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 7.0; InfoPath.3; .NET CLR 3.1.40767; Trident/6.0; en-IN)')).to eq(DeviceWizard::DeviceType::DESKTOP)
      end

      it 'should identify a ie9 browser as a desktop device' do
        expect(subject.get_device_type('Mozilla/5.0 (Windows; U; MSIE 9.0; WIndows NT 9.0; en-US))')).to eq(DeviceWizard::DeviceType::DESKTOP)
      end

      it 'should identify a ie8 browser as a desktop device' do
        expect(subject.get_device_type('Mozilla/5.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; GTB7.4; InfoPath.2; SV1; .NET CLR 3.3.69573; WOW64; en-US)')).to eq(DeviceWizard::DeviceType::DESKTOP)
      end

    end

    context 'firefox' do

      it 'should identify a firefox browser on windows as a desktop device' do
        expect(subject.get_device_type('Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1')).to eq(DeviceWizard::DeviceType::DESKTOP)
      end

      it 'should identify a firefox browser on mac as a desktop device' do
        expect(subject.get_device_type('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0')).to eq(DeviceWizard::DeviceType::DESKTOP)
      end

    end

    context 'safari' do

      it 'should identify a safari browser on windows as a desktop device' do
        expect(subject.get_device_type('Mozilla/5.0 (Windows; U; Windows NT 6.1; tr-TR) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27')).to eq(DeviceWizard::DeviceType::DESKTOP)
      end

      it 'should identify a safari browser on mac as a desktop device' do
        expect(subject.get_device_type('Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A')).to eq(DeviceWizard::DeviceType::DESKTOP)
      end

    end

  end

  context 'crawlers' do

    it 'should identify google bot as a crawler device' do
      expect(subject.get_device_type('Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)')).to eq(DeviceWizard::DeviceType::CRAWLER)
    end

    it 'should identify bing bot as a crawler device' do
      expect(subject.get_device_type('Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)')).to eq(DeviceWizard::DeviceType::CRAWLER)
    end

  end

  describe 'Details' do

    it 'should correctly collect type, os & browser details from a user agent string' do

      user_agent = "Mozilla/5.0 (iPhone; CPU iPhone OS 7_0 like Mac OS X; en-us) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53"
      details = subject.get_details(user_agent)

      expect(details.type).to eq('mobile')
      expect(details.browser.name).to eq('Safari')
      expect(details.os.name).to eq('IOS')

    end

  end

end
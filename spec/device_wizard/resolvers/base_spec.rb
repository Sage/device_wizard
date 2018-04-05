require 'spec_helper'

describe DeviceWizard::Resolvers::Base do
  describe '#details_klass' do
    it 'raises a not implemented exception' do
      expect { subject.details_klass }.to raise_error(NotImplementedError)
    end
  end
end

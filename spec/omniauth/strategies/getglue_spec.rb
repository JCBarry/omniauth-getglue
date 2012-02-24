require 'spec_helper'

describe OmniAuth::Strategies::GetGlue do
  before :each do
    @request = double('Request')
    @request.stub(:params) { {} }
  end

  subject do
    OmniAuth::Strategies::GetGlue.new(nil, @options || {}).tap do |strategy|
      strategy.stub(:request) { @request }
    end
  end

  describe '#client_options' do
    it 'has correct GetGlue site' do
      subject.options.client_options.site.should eq('http://api.getglue.com')
    end

    it 'has correct authorize url' do
      subject.options.client_options.authorize_url.should eq('http://getglue.com/oauth/authorize')
    end

    it 'has correct request token url' do
      subject.options.client_options.request_token_url.should eq('https://api.getglue.com/oauth/request_token')
    end

    it 'has correct access token url' do
      subject.options.client_options.access_token_url.should eq('https://api.getglue.com/oauth/access_token')
    end
  end

  describe '#uid' do
    it 'returns the uid from raw_info' do
      subject.stub(:username) { 'hjsimpson' }
      subject.uid.should eq('hjsimpson')
    end
  end

  describe '#info' do
    before :each do
      subject.stub(:username) { 'hjsimpson' }
      subject.stub(:display_name) { 'Homer J. Simpson' }
    end

    context 'when data is present in raw info' do
      it 'returns the name' do
        subject.info['uid'].should eq('hjsimpson')
      end

      it 'returns the email' do
        subject.info['name'].should eq('Homer J. Simpson')
      end
    end
  end

  describe '#extra' do
    before :each do
      @raw_info_hash = { "profile" => [] }
      subject.stub(:raw_info) { @raw_info_hash }
    end

    it 'returns a Hash' do
      subject.extra.should be_a(Hash)
    end
  end
end
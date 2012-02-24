require 'omniauth-oauth'
require 'nokogiri'

module OmniAuth
  module Strategies
    class GetGlue < OmniAuth::Strategies::OAuth
      option :client_options, {
        :site               => 'http://api.getglue.com',
        :authorize_url      => 'http://getglue.com/oauth/authorize',
        :request_token_url  => 'https://api.getglue.com/oauth/request_token',
        :access_token_url   => 'https://api.getglue.com/oauth/access_token'
      }

      uid { username }

      info do
        {
          'uid'   => username,
          'name'  => display_name
        }
      end

      extra do
        { 'raw_info' => 'raw_info' }
      end

      def username
        raw_info.xpath("/adaptiveblue/response/profile/username").inner_text
      end

      def display_name
        raw_info.xpath("/adaptiveblue/response/profile/displayName").inner_text
      end

      def raw_info
        @raw_info ||= Nokogiri::XML(access_token.get('http://api.getglue.com/v2/user/profile').body)
      end
    end
  end
end

OmniAuth.config.add_camelization 'getglue', 'GetGlue'
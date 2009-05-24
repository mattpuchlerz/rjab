require 'rubygems'
require 'restclient' # http://github.com/adamwiggins/rest-client

module Jabbify
  class Comet
        
    def initialize(custom_attributes = {})
      @custom_attributes = custom_attributes
      @overridden_attributes = {}
    end
    
    def attributes
      {
        :action  => :create,
        :api_key => nil,
        :message => nil,
        :name    => 'Server',
        :to      => nil,
        :type    => :message,
      }.merge @custom_attributes
    end
    
    def deliver(overridden_attributes = {})
      @overridden_attributes = overridden_attributes
      
      return false unless valid?
      
      begin
        RestClient.post jabbify_uri, uri_params
        true
      rescue
        false
      end
    end
    
    def self.deliver(options)
      new(options).deliver
    end
    
    def jabbify_uri
      'https://jabbify.com:8443/message_push'
    end
    
    def uri_params
      attrs = attributes.merge @overridden_attributes
      { 
        :action  => attrs[:action],
        :key     => attrs[:api_key],
        :message => attrs[:message],
        :name    => attrs[:name],
        :to      => attrs[:to],
        :type    => attrs[:type],
      }.reject { |key, value| value.nil? }
    end
    
    def valid?
      attrs = attributes.merge @overridden_attributes
      [ :api_key, :name, :message ].each do |attribute|
        return false if attrs[attribute].nil? or attrs[attribute].strip.length == 0
      end
      true
    end
    
    [ :action, :api_key, :message, :name, :to, :type ].each do |attribute|
      
      define_method attribute do
        attributes[attribute]
      end
      
      define_method "#{attribute}=" do |value|
        value = value.to_sym if [ :action, :type ].include? attribute
        @custom_attributes[attribute] = value
      end
      
    end
    
  end
end
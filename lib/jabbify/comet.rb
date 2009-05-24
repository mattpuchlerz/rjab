require 'rubygems'
require 'restclient' # http://github.com/adamwiggins/rest-client

module Jabbify
  class Comet
    
    DEFAULT_ATTRIBUTES = {
      :action  => :create,
      :api_key => nil,
      :message => nil,
      :name    => 'Server',
      :to      => nil,
      :type    => :message,
    }
        
    def initialize(custom_attributes = {})
      @customized_attributes = DEFAULT_ATTRIBUTES.merge custom_attributes
      @overridden_attributes = {}
    end
    
    def attributes
      @customized_attributes
    end
    
    def deliver(overridden_attributes = {})
      customized_attributes = @customized_attributes.dup
      @customized_attributes.merge! overridden_attributes
      ret = false
      
      if valid?
        begin
          RestClient.post jabbify_uri, uri_params
          ret = true
        rescue
        end
      end
      
      @customized_attributes = customized_attributes
      ret
    end
    
    def self.deliver(options)
      new(options).deliver
    end
    
    def jabbify_uri
      'https://jabbify.com:8443/message_push'
    end
    
    def uri_params
      { 
        :action  => @customized_attributes[:action],
        :key     => @customized_attributes[:api_key],
        :message => @customized_attributes[:message],
        :name    => @customized_attributes[:name],
        :to      => @customized_attributes[:to],
        :type    => @customized_attributes[:type],
      }.reject { |key, value| value.nil? }
    end
    
    def valid?
      [ :api_key, :name, :message ].each do |attribute|
        return false if @customized_attributes[attribute].nil? or @customized_attributes[attribute].strip.length == 0
      end
      true
    end
    
    DEFAULT_ATTRIBUTES.keys.each do |attribute|
      
      define_method attribute do
        attributes[attribute]
      end
      
      define_method "#{attribute}=" do |value|
        value = value.to_sym if [ :action, :type ].include? attribute
        @customized_attributes[attribute] = value
      end
      
    end
    
  end
end
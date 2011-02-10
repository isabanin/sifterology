module Sifterology
  
  class Request
    
    include HTTParty

    debug_output $stdout
    
    attr_reader :resource, :response
    
    def initialize(resource)
      @resource = resource
    end
    
    def perform(*args)
      method, path, options = args.shift, args.shift, args.last
      url = File.join(resource.session.account_url, path)
      options ||= {}
      prepare_options(options)      
      process_response(self.class.send(method, url, options))
    end
    
  private
  
    def default_headers
      self.class.default_options[:headers]
    end
    
    def setup_headers(options)
      options.merge!(
        :headers => {
          'X-Sifter-Token' => resource.session.token,
          'Content-Type'   => 'application/json',
          'Accept'         => 'application/json'
        }
      )
    end
    
    def prepare_options(options)
      setup_headers(options)
      
      if options[:body].kind_of?(Hash)
        options[:body] = options[:body].to_json
      end
    end
    
    def process_response(response)
      memorize_response_data(response)
      if response.response.kind_of?(Net::HTTPSuccess)
        response.parsed_response
      else
        convert_sifter_messages_to_exceptions(response['error'])
        response
      end
    end
    
    def convert_sifter_messages_to_exceptions(messages)
      [messages].each do |msg|
        raise ErrorTranslator.translate_to_exception(msg)
      end
    end
    
    def memorize_response_data(response)
      @response = response
    end
    
  end
  
end
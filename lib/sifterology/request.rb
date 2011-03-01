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
    
    def setup_headers
      Hash.new.tap do |h|
        h['X-Sifter-Token']  = resource.session.token
        h['Content-Type']    = 'application/json'
        h['Accept']          = 'application/json'
        h['X-Partner-Token'] = resource.session.partner_token if resource.session.partner_token
      end
    end
    
    def prepare_options(options)
      options[:headers] = setup_headers
      options[:body]    = options[:body].to_json if options[:body].kind_of?(Hash)
    end
    
    def process_response(response)
      memorize_response_data(response)
      if response.code == 200
        if response.respond_to?(:parsed_response)
          response.parsed_response
        else
          response
        end
      else
        convert_sifter_messages_to_exceptions(response['error'] || response['detail'])
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
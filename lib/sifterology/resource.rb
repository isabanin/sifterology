module Sifterology
  
  class Resource
    
    attr_reader :session, :factory
    attr_accessor :last_request
    
    def self.sifter_attrs(*args)
      args.each do |name|
        define_method(name) do
          instance_variable_get("@_sifter_#{name}")
        end
        
        define_method("#{name}=") do |value|
          instance_variable_set("@_sifter_#{name}", value)
        end
      end
    end
    
    def initialize(session, factory=nil)
      @session = session
      @factory = factory
    end
    
    def get(*args)
      request(:get, *args)
    end
    
    def post(*args)
      request(:post, *args)
    end
    
    def put(*args)
      request(:put, *args)
    end
    
    def delete(*args)
      request(:delete, *args)
    end

    def attributes=(hash)
      hash.each_pair do |name, value|
        instance_variable_set("@_sifter_#{ name }", value)
      end
    end
    
    def local_attributes=(hash)
      hash.each_pair do |name, value|
        instance_variable_set("@#{ name }", value)
      end
    end
    
  private
  
    def request(*args)
      @last_request = Request.new(self)
      @last_request.perform(*args)
    end
    
  end
  
end
module Sifterology
  
  class Session
    
    attr_reader :account_url, :token
    
    def initialize(account_url, token)
      @account_url = account_url
      @token       = token
    end
    
    def projects
      ProjectFactory.new(self)
    end
    
  end
  
end
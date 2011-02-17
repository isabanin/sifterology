module Sifterology
  
  class Session
    
    attr_reader :account_url, :token, :partner_token
    
    def initialize(account_url, token, options={})
      @account_url   = account_url
      @token         = token
      @partner_token = options[:partner_token]
    end
    
    def projects
      ProjectFactory.new(self)
    end
    
    def commits
      CommitFactory.new(self)
    end
    
  end
  
end
module Sifterology
  
  class SifterError < Exception
    
    attr_reader :text
    
    def initialize(text)
      @text = text
    end
    
    def message
      text
    end
    
  end
  
  class SSLRequired < Exception
    
    def message
      "Sifter API requires HTTPS protocol for proper functioning."      
    end
    
  end
  
  class InvalidToken < Exception
    
    def message
      "Specified API token is not valid."
    end
    
  end
  
  class InvalidAccount < Exception
    
    def message
      "Specified account domain is not valid."
    end
    
  end
  
end
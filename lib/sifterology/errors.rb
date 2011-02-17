module Sifterology
  
  class SifterError < Exception
    
    def initialize(msg=nil)
      @message = msg
    end
    
    def to_s
      @message
    end
    
  end
  
  class SSLRequired < SifterError; end
  
  class InvalidToken < SifterError; end
  
  class InvalidAccount < SifterError; end
  
end
module Sifterology
  
  module ErrorTranslator
    
    extend self
    
    def translate_to_exception(sifter_message)
      case sifter_message
      when /Secure Connection Required/i
        return SSLRequired.new
      when /Invalid Token/i
        return InvalidToken.new
      when /Invalid Account/i
        return InvalidAccount.new
      end
      
      SifterError.new(sifter_message)
    end
    
  end
  
end
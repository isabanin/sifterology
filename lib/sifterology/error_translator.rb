module Sifterology
  
  module ErrorTranslator
    
    extend self
    
    def translate_to_exception(sifter_message)
      case sifter_message
      when /Secure Connection Required/i
        return SSLRequired.new(sifter_message)
      when /Invalid Token/i
        return InvalidToken.new(sifter_message)
      when /Invalid Account/i
        return InvalidAccount.new(sifter_message)
      end
      
      SifterError.new(sifter_message)
    end
    
  end
  
end
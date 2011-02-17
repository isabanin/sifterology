module Sifterology
  
  class CommitFactory < Resource
    
    def create(attrs={})
      build(attrs).save
    end
    
    def build(attrs={})
      commit = Commit.new(session, self)
      commit.local_attributes = attrs
      commit
    end
    
  end
  
end
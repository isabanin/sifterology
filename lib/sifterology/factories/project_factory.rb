module Sifterology
  
  class ProjectFactory < Resource
    
    def entity_base
      '/api/projects'
    end
    
    def find_all
      [].tap do |arr|
        get("#{ entity_base }/?all=true")['projects'].each do |project_attrs|
          arr << build(project_attrs)
        end
      end
    end
    
    def build(attributes)
      Project.new(session, self).tap do |p|
        p.attributes = attributes
      end
    end
    
    def new_from_url(url)
      Project.new(session, self).tap do |p|
        p.api_url = url
      end
    end
    
  end
  
end
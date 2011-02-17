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
      project = Project.new(session, self)
      project.attributes = attributes
      project
    end
    
  end
  
end
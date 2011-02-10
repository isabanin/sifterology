module Sifterology
  
  class ProjectFactory < Resource
    
    def entity_base
      '/api/projects'
    end
    
    def find_all
      projects = []
      projects.tap do
        get("#{ entity_base }/")['projects'].each do |project_attrs|
          projects << build(project_attrs)
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
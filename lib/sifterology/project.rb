require 'open-uri'

module Sifterology
  
  class Project < Resource
    
    sifter_attrs :name, :api_url, :archived, :primary_company_name
    
    def archived?
      archived
    end
    
    def api_path
      URI.parse(api_url).path
    end
    
    def test_request
      response = post(File.join(api_path, 'beanstalk', 'test'), :body => '')
      response && response["summary"] == 'Success'
    end
    
  end
  
end
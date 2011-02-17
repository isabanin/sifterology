module Sifterology
  
  class Commit < Resource
    
    attr_accessor :project_url, :status, :asignee, :issue, :changeset_url,
                  :committer, :committer_email, :commit_time, :commit_message
    
    def save
      post(entity_path, :body => payload)
    end
    
    def attributes=(attrs)
      super
      self.asignee = '' if attrs[:unassign]
    end
    
    def entity_path
      File.join(project_path, 'beanstalk')
    end
    
    def project_path
      URI.parse(project_url).path
    end
    
  private
  
    def payload
      sanitize_payload({
        "issue"    => issue,
        "assignee" => asignee,
        "status"   => status,
        "commit" => {
          "changeset_url" => changeset_url,
          "message"       => commit_message,
          "author"        => committer,
          "author_email"  => committer_email,
          "time"          => commit_time,
        }
      })
    end
    
    def sanitize_payload(hash)
      hash.delete("status")  if hash["status"].nil?
      hash.delete("assignee") if hash["assignee"].nil?
      hash
    end
    
  end
  
end
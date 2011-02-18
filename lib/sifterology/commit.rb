module Sifterology
  
  class Commit < Resource
    
    attr_accessor :project_url, :status, :assignee, :unassign, :issue, :changeset_url,
                  :committer, :committer_email, :commit_time, :commit_message
    
    def save
      post(entity_path, :body => payload)
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
        "assignee" => assignee,
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
      hash.tap do |h|
        h['assignee'] = ''   if unassign
        h.delete("status")   if hash["status"].nil?
        h.delete("assignee") if hash["assignee"].nil?
      end
    end
    
  end
  
end
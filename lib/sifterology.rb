require 'httparty'
require 'json'

module Sifterology
  
  VERSION = '0.1.2'

  def self.session(account_url, token, options={})
    Session.new(account_url, token, options)
  end
  
end

def require_local(suffix)
  require(File.expand_path(File.join(File.dirname(__FILE__), suffix)))
end

require_local "sifterology/errors"
require_local "sifterology/error_translator"
require_local "sifterology/request"
require_local "sifterology/resource"
require_local "sifterology/session"
require_local "sifterology/project"
require_local "sifterology/commit"
require_local "sifterology/factories/project_factory"
require_local "sifterology/factories/commit_factory"
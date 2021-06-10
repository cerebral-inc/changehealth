# order matters
require "change_health/authentication"
require "change_health/configuration"
require "change_health/request"
require "change_health/restful_resource"
require "change_health/response"
require "change_health/version"

resources_v3_path = File.expand_path('change_health/resources/*/*.rb', File.dirname(__FILE__))
Dir[resources_v3_path].each { |f| require f[/\/lib\/(.+)\.rb$/, 1] }

resources_path = File.expand_path('change_health/resources/*.rb', File.dirname(__FILE__))
Dir[resources_path].each { |f| require f[/\/lib\/(.+)\.rb$/, 1] }

require 'active_support/core_ext/hash'

module ChangeHealth
  # Your code goes here...
  class AuthError < StandardError; end
  class AccessTokenNotPresentError < StandardError; end
  class InvalidApiUrlError < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end

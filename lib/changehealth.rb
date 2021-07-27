require "changehealth/authentication"
require "changehealth/configuration"
require "changehealth/request"
require "changehealth/restful_resource"
require "changehealth/response"
require "changehealth/version"

resources_path = File.expand_path('changehealth/resources/*/*.rb', File.dirname(__FILE__))
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

  def self.logger
    @@logger ||= defined?(Rails) ? Rails.logger : Logger.new(STDOUT)
  end

  def self.logger=(logger)
    @@logger = logger
  end
end

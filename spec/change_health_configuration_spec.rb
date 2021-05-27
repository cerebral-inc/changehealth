require "spec_helper"

RSpec.describe ChangeHealth::Configuration do
  it "has an environment string" do
    ChangeHealth.configure do |config|
      config.environment = 'sandbox'
    end
    expect(ChangeHealth.configuration.environment).to eq(:sandbox)
  end
end

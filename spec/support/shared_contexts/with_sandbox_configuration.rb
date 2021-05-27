RSpec.shared_context 'with sandbox configuration' do
  before do
    ::ChangeHealth.configure do |config|
      config.environment = :sandbox
    end
  end
end

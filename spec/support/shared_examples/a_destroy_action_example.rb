RSpec.shared_examples_for 'a destroy action' do
  include_context 'with authentication'

  let(:entity_id) { 'some_id' }

  subject(:response) { described_class.new(*arguments).destroy(entity_id) }

  before do
    request_path = Regexp.new(
      Regexp.escape("api/#{resource_base_path}/#{entity_id}")
    )

    stub_request(:delete, request_path).to_return(status: 200)
  end

  its(:code) { is_expected.to eq(200) }
  its(:data) { is_expected.to be_blank }
end

RSpec.shared_examples_for 'a create action' do
  include_context 'with authentication'

  let(:attributes) do
    { field: 'value' }
  end

  subject(:response) { described_class.new(*arguments).create(attributes) }

  before do
    response_body = attributes.merge(id: 'some_id').to_json
    request_path = Regexp.new(
      Regexp.escape("api/#{resource_base_path}")
    )

    stub_request(:post, request_path).
      with(body: attributes).
      to_return(
        status: 200,
        body: response_body,
        headers: { 'Content-Type' => 'application/json' }
      )
  end

  its(:code) { is_expected.to eq(200) }
end

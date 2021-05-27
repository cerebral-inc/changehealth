require "spec_helper"

RSpec.describe ChangeHealth::Resources::V3::Eligibility do
  include_context "with sandbox configuration"

  let(:resource_base_path) { }
  let(:arguments) { [] }

  it_behaves_like "a create action"
end

require 'spec_helper'

describe <%= class_name %> do
  let(:<%= singular_name %>) { create(:<%= singular_name %>) }
  subject { <%= singular_name %> }

  it "should be audited" do
    with_versioning { should have_many :versions}
  end

  pending "add some examples to (or delete) #{__FILE__}"
end

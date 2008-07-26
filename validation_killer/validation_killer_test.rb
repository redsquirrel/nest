require 'test/unit'

module ActiveRecord
  module Base
    @foo_callbacks = %w(dave staci)
    @bar_callbacks = %w(rose ricky charlie)
    @baz_callbacks = nil
  end
  module Validations
    VALIDATIONS = %w(foo bar baz)
  end
end

require 'validation_killer'

class ValidationKillerTest < Test::Unit::TestCase
  def test_happy_path
    assert ActiveRecord::Base.instance_eval { ! @foo_callbacks.empty? }
    ActiveRecord::Base.clear_all_validations
    assert ActiveRecord::Base.instance_eval { @foo_callbacks.empty? }
  end
end
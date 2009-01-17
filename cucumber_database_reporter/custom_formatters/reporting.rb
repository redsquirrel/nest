require 'activerecord'

CONFIG = {
  :adapter => "mysql",
  :username => "root",
  :database => "cuke_sandbox"
}

class TestRun < ActiveRecord::Base
  has_many :features
  establish_connection(CONFIG)
end

class Feature < ActiveRecord::Base
  belongs_to :test_run
  has_many :scenarios
  establish_connection(CONFIG)
end

class Scenario < ActiveRecord::Base
  belongs_to :feature
  has_many :steps
  establish_connection(CONFIG)
end

class Step < ActiveRecord::Base
  belongs_to :scenario
  establish_connection(CONFIG)
end

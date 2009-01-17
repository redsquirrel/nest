require File.dirname(__FILE__) + '/reporting'

class DatabaseReport
  def initialize(*ignored)
    @run = TestRun.create!(:time_start => Time.now)
  end
  
  def feature_executing(feature)
    @feature = @run.features.create!(:file => feature.file)
    puts "Here we go...#{feature.file}"
  end

  def header_executing(header)
    @feature.update_attribute(:header, header)
  end

  def scenario_executing(scenario)
    @scenario = @feature.scenarios.create!(:name => scenario.name)
  end

  def scenario_executed(scenario)
    @run.update_attribute(:time_stop, Time.now)
  end

  def step_passed(*args)
    #step, regexp, args
    @scenario.update_attribute(:status, "passed")
    @scenario.steps.create!(:dump => args.inspect)
    puts "step_passed"
  end

  def step_failed(*args)
    #step, regexp, args
    @scenario.update_attribute(:status, "failed")
    @scenario.steps.create!(:dump => args.inspect)
    puts "YOU TOTALLY FAILED!!!!!!!!!!!!!!"
  end

  def step_pending(*args)
    #step, regexp, args
    @scenario.update_attribute(:status, "skipped")
    @scenario.steps.create!(:dump => args.inspect)
    puts "step_pending"
  end

  def step_traced(*args)
    #step, regexp, args
    @scenario.update_attribute(:status, "traced")
    @scenario.steps.create!(:dump => args.inspect)
    puts "step_traced"
  end
end
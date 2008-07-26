Validation Killer can be useful for opening up third-party ActiveRecord::Base models and redefining validations.  Currently this means you'll need to blow away all the validations and redefine the ones you want.

So, let's say you're using some models that shouldn't be touched...

class User < ActiveRecord::Base
  validates_presence_of :name
  validates_confirmation_of :email
end

...but you need to change some of these validations.  Grab validation killer and require it...

require 'validation_killer'

User.new(:name => "Dave").valid?  # false, wants an email

User.class_eval
  clear_all_validations
  validates_presence_of :name
end

User.new(:name => "Dave").valid?  # true, only cares about name

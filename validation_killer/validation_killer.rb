module Obtiva
  module ValidationKiller
    def clear_all_validations
      ActiveRecord::Validations::VALIDATIONS.each do |validation|
        callback_chain = instance_variable_get("@#{validation}_callbacks")
        callback_chain.clear if callback_chain
      end
    end
  end
end

ActiveRecord::Base.extend Obtiva::ValidationKiller
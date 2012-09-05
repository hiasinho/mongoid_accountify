# -*- encoding : utf-8 -*-
module Mongoid
  module Accountify
    class Railtie < Rails::Railtie
      ActiveSupport.on_load :action_controller do
        before_filter do |c|
          unless Mongoid::Accountify.configuration.account_model.respond_to? :current
            Mongoid::Accountify.configuration.account_model.send(
              :include,
              Mongoid::Accountify::Account
            )
          end

          Mongoid::Accountify.configuration.account_model.current = c.send(Mongoid::Accountify.configuration.account_reader)
        end
      end
    end
  end
end
# -*- encoding : utf-8 -*-
module Mongoid
  module Accountify
    module Account
      extend ActiveSupport::Concern

      included do
        def current?
          !Thread.current[:account].nil? && self.id == Thread.current[:account].id
        end
      end

      module ClassMethods
        def current
          Thread.current[:account]
        end

        def current=(value)
          Thread.current[:account] = value
        end

        def do_as(account, &block)
          old = self.current

          begin
            self.current = account
            response = block.call unless block.nil?
          ensure
            self.current = old
          end

          response
        end
      end
    end
  end
end
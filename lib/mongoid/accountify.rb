# -*- encoding : utf-8 -*-
module Mongoid
  module Accountify
    extend ActiveSupport::Concern

    autoload :Version, 'mongoid/accountify/version'
    autoload :Railtie, 'mongoid/accountify/railtie'
    autoload :Config,  'mongoid/accountify/config'
    autoload :Account, 'mongoid/accountify/account'

    included do
      
      belongs_to Mongoid::Accountify.configuration.account_relation
      validates_presence_of Mongoid::Accountify.configuration.account_relation

      after_initialize :set_account

      protected
        def set_account
          return unless Mongoid::Accountify.configuration.account_model.respond_to? :current
          field = "#{Mongoid::Accountify.configuration.account_relation.to_s}=".to_sym
          
          self.send(field, Mongoid::Accountify.configuration.account_model.current)
        end
    end

    class << self
      def configure(&block)
        @configuration = Mongoid::Accountify::Config.new(&block)
      end

      def configuration
        @configuration ||= Mongoid::Accountify::Config.new
      end 
    end
  end
end

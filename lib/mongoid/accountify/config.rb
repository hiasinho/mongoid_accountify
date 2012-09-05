# -*- encoding : utf-8 -*-
module Mongoid
  module Accountify
    class Config
      attr_accessor :account_reader
      attr_accessor :account_model
      attr_accessor :account_relation

      def initialize(&block)
        @account_reader = :current_account
        @account_model = :account
        @account_relation = :account

        instance_eval(&block) if block_given?
      end

      def account_model
        @account_model.to_s.classify.constantize
      end
    end
  end
end
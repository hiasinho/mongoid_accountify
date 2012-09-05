# MongoidAccountify

MongoidAccountify adds a relation to models to a Account model and sets it on model initialization.

## Install

 ```ruby
 gem 'mongoid_accountify'
 ```

## Usage

 ```ruby
 # Default config
 Mongoid::Accountify.configure do |c|
   c.account_reader = :current_account
   c.account_model = :account
   c.account_relation = :account
 end

 # Example model
 class Person
   include Mongoid::Document
   include Mongoid::Accountify
 end
 
 # Build instance
 p = Person.new

 # Account instance
 p.creator
 # => <Account _id: 50470dce6f51b7c68e000009>
 ```

## Credits

Copyright (c) 2012 Mathias Schneider <http://www.codecrafts.de>
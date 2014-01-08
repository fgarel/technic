#!/bin/env ruby

require 'rubygems'
require 'sequel'

DB = Sequel.sqlite # memory database

DB.run("create table t (a text, b text)")
DB.run("insert into t values ('a', 'b')")


#DB.create_table :items do
#  primary_key :id
#  String :name
#  Float :price
#  Double :price
#end

items = DB[:items] # Create a dataset

# Populate the table
#items.insert(:name => 'abc', :price => rand * 100)
#items.insert(:name => 'def', :price => rand * 100)
#items.insert(:name => 'ghi', :price => rand * 100)
items.insert(:name => 'abc')
#items.insert(:name => 'def')
#items.insert(:name => 'ghi')

# Print out the number of records
puts "Item count: #{items.count}"

# Print out the average price
#puts "The average price is: #{items.avg(:price)}"

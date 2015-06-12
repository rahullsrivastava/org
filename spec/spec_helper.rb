require 'simplecov'
require "factory_girl"
SimpleCov.start
require_relative '../lib/organization.rb'
require_relative '../lib/organization/filters.rb'
require_relative 'factories/managerial_department.rb'
require_relative 'factories/procurement_department.rb'
require_relative 'factories/inventory_by_color.rb'



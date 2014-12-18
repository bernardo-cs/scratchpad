## How to class and instances can share instance variables inside
## modules.
gem 'activesupport'
require 'active_support/concern'
require 'forwardable'
require 'ostruct'

module Mamal
	extend ActiveSupport::Concern
	extend Forwardable

	def_delegator :values, :has_many

	module ClassMethods
		attr_accessor :values

		def has_many hsh={}
			@values = OpenStruct.new
			@values.has_many = hsh
		end
	end

	def values
		self.class.values
	end
end

class Dog
	include Mamal
	has_many fur: { on: :body }

	def bark
		'woof'
	end

	def body
		has_many.to_a.join " "
	end
end

puts Dog.new.body

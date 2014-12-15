## How to class and instances can share instance variables inside
## modules.
gem 'activesupport'
require 'active_support/concern'

module Mamal
	extend ActiveSupport::Concern

	module ClassMethods
		attr_accessor :values

		def has_many hsh={}
			@values = hsh
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
		values.to_a.join " "
	end
end

puts Dog.new.body

 module BeforeAfterInit
   module InstanceMethods
     #def before_initialize *a, &b
     #end
     #def after_initialize *a, &b
     #end
     def initialize *a, &b
       before_initialize *a, &b
       r = super
       after_initialize *a, &b
       r
     end
   end
   module ClassMethods
     def before &b
       define_method 'before_initialize', &b
     end
     def after &b
       define_method 'after_initialize', &b
     end
   end
   def self.included other
     other.module_eval{ include InstanceMethods }
     other.extend ClassMethods
     super
   end
end

class C
   include BeforeAfterInit

   before{ @a = 40 }
   after{ @b = 2 }

   def m() @a + @b end
end

p C.new.m

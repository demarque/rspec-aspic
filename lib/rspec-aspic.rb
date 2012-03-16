require "rspec-aspic/version"

module RSpecAspic
  def self.included(klass)
    klass.extend(InstanceMethods)
    klass.send(:include, ClassMethods)
  end

  module InstanceMethods
    def the(attribute, &block)
      context "#{attribute}" do
        subject { eval("#{attribute}") }
        it(&block)
      end
    end
  end

  module ClassMethods
  end
end

module RSpecAspic
  def self.included(klass)
    klass.extend(InstanceMethods)
  end

  module InstanceMethods
    def the(attribute, &block)
      context "#{attribute}" do
        subject { eval("#{attribute}") }
        it(&block)
      end
    end

    def fixture(name, value, &block)
      context "with the fixture #{name} : #{value.inspect}" do
        let(name) { value }

        subject { send(name) }

        self.instance_exec &block
      end
    end
  end
end

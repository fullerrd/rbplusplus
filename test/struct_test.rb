require 'test_helper'

context "Nested Struct" do

  specify "should be accessible" do
    Extension.new "nested" do |e|
      e.sources full_dir("headers/nested_struct.h")
      e.namespace "nested"
    end

    require 'nested'

    should.not.raise NameError do
      Klass::NestedStruct.new.one.should == 1
    end

    should.raise NameError do
      Klass::PrivateNestedStruct.new
    end
  end
  
end

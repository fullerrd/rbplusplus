$:.unshift File.expand_path(File.dirname(__FILE__))
$:.unshift File.expand_path(File.dirname(__FILE__) + "/rbplusplus")

require 'rubygems'
require 'rbgccxml'

require 'inflector'
require 'fileutils'
require 'singleton'
require 'rbplusplus/rbplusplus'

require 'fileutils'

module RbPlusPlus

  RBPP_COMMENT = "// This file generated by rb++"

  autoload :Extension, "rbplusplus/extension"
  autoload :RbModule, "rbplusplus/module"
  autoload :Logger, "rbplusplus/logger"

  module Builders
    autoload :Base, "rbplusplus/builders/base"
    autoload :MethodBase, "rbplusplus/builders/method_base"
    autoload :ExtensionNode, "rbplusplus/builders/extension"
    autoload :GlobalFunctionNode, "rbplusplus/builders/global_function"
    autoload :IncludeNode, "rbplusplus/builders/include"
    autoload :EnumerationNode, "rbplusplus/builders/enumeration"
    autoload :ConstNode, "rbplusplus/builders/const"
    autoload :ModuleNode, "rbplusplus/builders/module"
    autoload :ClassNode, "rbplusplus/builders/class"
    autoload :ConstructorNode, "rbplusplus/builders/constructor"
    autoload :MethodNode, "rbplusplus/builders/method"
    autoload :ModuleFunctionNode, "rbplusplus/builders/module_function"
    autoload :StaticMethodNode, "rbplusplus/builders/static_method"
    autoload :InstanceVariableNode, "rbplusplus/builders/instance_variable"
    autoload :AllocationStrategyNode, "rbplusplus/builders/allocation_strategy"
    autoload :ConstConverterNode, "rbplusplus/builders/const_converter"

    autoload :ClassHelpers, "rbplusplus/builders/helpers/class"
    autoload :EnumerationHelpers, "rbplusplus/builders/helpers/enumeration"
    autoload :ModuleHelpers, "rbplusplus/builders/helpers/module"

  end

  module Writers
    autoload :Base, "rbplusplus/writers/base"
    autoload :ExtensionWriter, "rbplusplus/writers/extension"
    autoload :MultipleFilesWriter, "rbplusplus/writers/multiple_files_writer"
    autoload :SingleFileWriter, "rbplusplus/writers/single_file_writer"
  end
end

class String #:nodoc:
  # Functionize attempts to rename a string in a cpp function friendly way.
  #
  # vector<float>::x => vector_float__x
  def as_variable
    gsub("::","_").gsub(/[ ,<>]/, "_").gsub("*", "Ptr")
  end
end

require 'rbplusplus/transformers/rbgccxml'
require 'rbplusplus/transformers/node_cache'
require 'rbplusplus/transformers/node'
require 'rbplusplus/transformers/node_reference'
require 'rbplusplus/transformers/function'
require 'rbplusplus/transformers/class'
require 'rbplusplus/transformers/module'
require 'rbplusplus/transformers/method'
require 'rbplusplus/transformers/namespace'


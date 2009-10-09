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

  autoload :Extension,                "rbplusplus/extension"
  autoload :RbModule,                 "rbplusplus/module"
  autoload :Logger,                   "rbplusplus/logger"

  module Builders

    autoload :Base,                   "rbplusplus/builders/base"
    autoload :ExtensionNode,          "rbplusplus/builders/extension"

    autoload :ConstNode,              "rbplusplus/builders/const"
    autoload :ModuleNode,             "rbplusplus/builders/module"
    autoload :IncludeNode,            "rbplusplus/builders/include"
    autoload :EnumerationNode,        "rbplusplus/builders/enumeration"

    # Class related nodes
    autoload :ClassNode,              "rbplusplus/builders/class"
    autoload :DirectorNode,           "rbplusplus/builders/director"
    autoload :ConstructorNode,        "rbplusplus/builders/constructor"
    autoload :InstanceVariableNode,   "rbplusplus/builders/instance_variable"

    # Rice type-management nodes
    autoload :ConstConverterNode,     "rbplusplus/builders/const_converter"
    autoload :AllocationStrategyNode, "rbplusplus/builders/allocation_strategy"

    # Method Nodes
    autoload :MethodBase,             "rbplusplus/builders/method_base"
    autoload :MethodNode,             "rbplusplus/builders/method"
    autoload :StaticMethodNode,       "rbplusplus/builders/static_method"
    autoload :DirectorMethodNode,     "rbplusplus/builders/director_method"
    autoload :ModuleFunctionNode,     "rbplusplus/builders/module_function"
    autoload :GlobalFunctionNode,     "rbplusplus/builders/global_function"

    # Helpers
    autoload :ClassHelpers,           "rbplusplus/builders/helpers/class"
    autoload :EnumerationHelpers,     "rbplusplus/builders/helpers/enumeration"
    autoload :ModuleHelpers,          "rbplusplus/builders/helpers/module"

  end

  module Writers
    autoload :Base,                   "rbplusplus/writers/base"
    autoload :ExtensionWriter,        "rbplusplus/writers/extension"
    autoload :MultipleFilesWriter,    "rbplusplus/writers/multiple_files_writer"
    autoload :SingleFileWriter,       "rbplusplus/writers/single_file_writer"
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

# Transformer classes that reopen RbGCCXML classes to add functionality
require 'rbplusplus/transformers/rbgccxml'
require 'rbplusplus/transformers/node_cache'
require 'rbplusplus/transformers/node'
require 'rbplusplus/transformers/function'
require 'rbplusplus/transformers/class'
require 'rbplusplus/transformers/method'
require 'rbplusplus/transformers/namespace'


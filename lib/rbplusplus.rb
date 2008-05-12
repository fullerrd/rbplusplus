$:.unshift File.expand_path(File.dirname(__FILE__))
$:.unshift File.expand_path(File.dirname(__FILE__) + "/rbplusplus")

gem 'rbgccxml'
require 'rbgccxml'

require 'inflector'
require 'fileutils'
require 'rbplusplus/rbplusplus'

module RbPlusPlus

  RBPP_COMMENT = "// This file generated by rb++"

  autoload :Extension, "rbplusplus/extension"
  autoload :RbModule, "rbplusplus/module"

  module Builders
    autoload :Base, "rbplusplus/builders/base"
    autoload :ClassBuilder, "rbplusplus/builders/class"
    autoload :ExtensionBuilder, "rbplusplus/builders/extension"
    autoload :ModuleBuilder, "rbplusplus/builders/module"
  end

  module Writers
    autoload :Base, "rbplusplus/writers/base"
    autoload :ExtensionWriter, "rbplusplus/writers/extension"
    autoload :MultipleFilesWriter, "rbplusplus/writers/multiple_files_writer"
    autoload :SingleFileWriter, "rbplusplus/writers/single_file_writer"
  end
end


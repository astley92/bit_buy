require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)

loader = Zeitwerk::Loader.new
loader.push_dir("lib")
loader.setup

require("active_support")
require("active_support/core_ext/module/delegation")
require("thread")

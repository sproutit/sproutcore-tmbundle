#!/usr/bin/env ruby
FILENAME = ENV['TM_FILENAME']
FILEPATH = ENV['TM_FILEPATH']
SUPPORT  = ENV['TM_BUNDLE_SUPPORT']
JSC   = "#{SUPPORT}/bin/JavaScriptCore.framework/Resources/jsc"

JSLINT   = "#{SUPPORT}/bin/jslint.js"
PREFS = "#{SUPPORT}/bin/prefs.js"
LAUNCHER = "#{SUPPORT}/bin/jsclinter.js"
# BINARY   = `uname -a` =~ /i386/ ? "#{SUPPORT}/bin/intel/jsl" : "#{SUPPORT}/bin/ppc/jsl"

output = `"#{JSC}" "#{JSLINT}" "#{PREFS}" "#{LAUNCHER}" -- "#{FILEPATH}" "quick"`
puts output
#!/usr/bin/env ruby
FILENAME = ENV['TM_FILENAME']
FILEPATH = ENV['TM_FILEPATH']
SUPPORT  = ENV['TM_BUNDLE_SUPPORT']
TAB_SIZE = ENV['TM_TAB_SIZE']
SELECTED_TEXT = ENV['TM_SELECTED_TEXT']
JSC   = "#{SUPPORT}/bin/JavaScriptCore.framework/Resources/jsc"

BEAUTIFY   = "#{SUPPORT}/bin/beautify.js"
LAUNCHER = "#{SUPPORT}/bin/beautifier.js"
# BINARY   = `uname -a` =~ /i386/ ? "#{SUPPORT}/bin/intel/jsl" : "#{SUPPORT}/bin/ppc/jsl"
if (SELECTED_TEXT)
  #pass the selected text options as arguments to the launcher
  # puts "#{BEAUTIFY} #{LAUNCHER}  --  {selectedText: true, tabSize: #{TAB_SIZE}}"
  sel = "#{SELECTED_TEXT}"
  sel.gsub!('"','\"')
  output = `"#{JSC}" "#{BEAUTIFY}" "#{LAUNCHER}" -- "{selectedText: true, tabSize: #{TAB_SIZE}, indentSize: 4}" "#{sel}"`
else
  #pass the selected file and '-f' param as an argument to the launcher
   output = `"#{JSC}" "#{BEAUTIFY}" "#{LAUNCHER}" -- "{file: '#{FILEPATH}', tabSize: #{TAB_SIZE}, indentSize: 4}"`
end
#output = output.split(/\n/)
puts output
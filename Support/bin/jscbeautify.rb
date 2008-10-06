#!/usr/bin/env ruby
require "fileutils"

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
  #   my_file = File.new(ENV['TM_BUNDLE_SUPPORT'] +  "/tmp/jsc-tmp.js", "w+")
  #   my_file.puts(sel)
  path = ENV['TM_BUNDLE_SUPPORT'] +  "/jsc-tmp" + rand(1000000).to_s + ".js"
  my_file = File.new(path,"w+") # create a file object
  my_file.puts(sel)             # put the selection in it
  my_file.flock(File::LOCK_UN)  # unlock the file
  output = `"#{JSC}" "#{BEAUTIFY}" "#{LAUNCHER}" -- "{file: '#{path}', tabSize: #{TAB_SIZE}, indentSize: 4}"`
  File.delete(path)
else
  #pass the selected file and '-f' param as an argument to the launcher
   output = `"#{JSC}" "#{BEAUTIFY}" "#{LAUNCHER}" -- "{file: '#{FILEPATH}', tabSize: #{TAB_SIZE}, indentSize: 4}"`
end
#output = output.split(/\n/)
puts output
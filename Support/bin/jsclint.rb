#!/usr/bin/env ruby
FILENAME = ENV['TM_FILENAME']
FILEPATH = ENV['TM_FILEPATH']
SUPPORT  = ENV['TM_BUNDLE_SUPPORT']
JSC   = "#{SUPPORT}/bin/JavaScriptCore.framework/Resources/jsc"

JSLINT   = "#{SUPPORT}/bin/jslint.js"
PREFS = "#{SUPPORT}/bin/prefs.js"
LAUNCHER = "#{SUPPORT}/bin/jsclinter.js"
# BINARY   = `uname -a` =~ /i386/ ? "#{SUPPORT}/bin/intel/jsl" : "#{SUPPORT}/bin/ppc/jsl"

output = `"#{JSC}" "#{JSLINT}" "#{PREFS}" "#{LAUNCHER}" -- "#{FILEPATH}"`

html = <<WTF
<html>
  <head>
    <title>JavaScript Lint Results</title>
    <style type="text/css">
      body {
        font-size: 13px;
      }
      
      pre, code {
        background-color: #eee;
        color: #400;
        margin: 3px 0;
      }
      
      h1, h2 { margin: 0 0 5px; }
      
      h1 { font-size: 20px; }
      h2 { font-size: 16px;}
      
      span.warning {
        color: #c90;
        text-transform: uppercase;
        font-weight: bold;
      }
      
      span.error {
        color: #900;
        text-transform: uppercase;
        font-weight: bold;
      }
      
      ul {
        margin: 10px 0 0 20px;
        padding: 0;
      }
      
      li {
        margin: 0 0 10px;
      }
    </style>
  </head>
  <body>
    <h1>JavaScript Lint</h1>
    
    <ul>
      #{output}
    </ul>
  </body>
</html>  
WTF

puts html
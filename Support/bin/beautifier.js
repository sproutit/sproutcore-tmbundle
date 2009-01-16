// jsc beautifier 
// Uses jsc, the javascript commandline shell, to execute Beautify on selected text or file
// js_beautify(js_source_text, indent_size, indent_character, indent_level)
/*extern js_beautify */
/*global print, quit, readFile, escape */

(function(a) {
  var options = a[0]; //JSON options from commandline
  var filepath, sel, output;
  //parse options
  //simple test for json hash format
  if (options && options[0] === '{' && options[options.length - 1] === '}') {
    //turn our options into an object (this is hacky because of the way
    //jsc works)
    eval("options = " + options);
    // print("options: selection" + options.selection);
  } else {
    print("no options provided");
  }

  if (options.file) {
    sel = readFile(options.file);
  }

  if (!sel) {
    // print("Selection failed");
    quit(1);
    // print("nothing to format");
  }

  // sel = unescape(encodeURIComponent(sel));
  // js_beautify(js_source_text, indent_size, indent_character, indent_level)
  output = js_beautify(sel, options.tabSize, " ");
  //this takes the output and decodes it to UTF8 (it gets encoded by readFile, apparently)
  output = decodeURIComponent(escape(output));
  print(output);
})(arguments);
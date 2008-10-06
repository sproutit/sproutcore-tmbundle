// jsc beautifier 
// Uses jsc, the javascript commandline shell, to execute Beautify on selected text or file
// js_beautify(js_source_text, indent_size, indent_character, indent_level)
/*extern js_beautify */
/*global print, quit, readFile */

(function(a) {
  var options = a[0]; //JSON options from commandline
  var filepath, sel, output;
  //parse options
  //simple test for json hash format
  if (options && options[0] === '{' && options[options.length - 1] === '}') {
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

  // js_beautify(js_source_text, indent_size, indent_character, indent_level)
  output = js_beautify(sel, options.tabSize, " ");
  print(output);

})(arguments);

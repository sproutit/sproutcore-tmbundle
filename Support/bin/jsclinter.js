// jsc linter 
// Uses jsc, the javascript commandline shell, to execute JSLint
// adapted from 
// rhino.js
// 2007-02-19
/*
Copyright (c) 2002 Douglas Crockford  (www.JSLint.com) Rhino Edition
*/

/*extern JSLINT, JSLINT_PREFS */
/*global print, quit, readFile */

(function(a) {
    if (!a[0]) {
        print("Usage: jslint.js file.js");
        quit(1);
    }
    var prefs = JSLINT_PREFS;
    var input = readFile(a[0]);
    var filepath = a[0];
    if (!prefs) {
        prefs = {
            rhino: true,
            passfail: false
        };
    }
    if (!input) {
        print("jslint: Couldn't open file '" + a[0] + "'.");
        quit(1);
    }
    if (!JSLINT(input, prefs)) {
        if (filepath) {
            JSLINT.filepath = filepath;
        }
        print(JSLINT.report(false, "asdfj;alskdjf;alskjdf"));
    } else {
        print("jslint: No problems found in " + a[0]);
        quit(1);
    }
})(arguments);
---
layout: post
---
I had a need to write some quick and dirty tests for a javascript library I was working on and whipped up a minimal (one line) assertion function which fills all of my testing requirements on simple projects:

    var assert = function(test, description){ console.log("[" + (test ? "PASS" : "FAIL") + "] " + description); };
    
Assertions can be made like so:

    assert(true !== false, "True is not false");
    
will result in:

    [TRUE] True is not false

Throw the assert function and your tests together into `someTests.js` and execute them: `node someTests`.
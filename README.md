# qunit-jscheck
[QUnit](http://qunitjs.com/) integration for [JSCheck](http://www.jscheck.org/) ([github](https://github.com/douglascrockford/JSCheck)) property based testing

Creating test cases for passing checks is disabled by default. 

A summary test case is inserted at the end stating how many checks were performed.
Failing checks are inserted as test cases so that you can see which inputs need debugging.

# Usage

Load after JSCheck, else the JSC global will be undefined and this won't work.

# Writing tests

Assuming you've got QUnit working already, and you've loaded the JSCheck and qunit-jscheck files, you can write tests that look like this:

```javascript

function le(a, b) {
  return a <= b;
}


JSC.group("Less than");
JSC.test(
    "Less than",
    function (verdict, a, b) {
        return verdict(le(a, b));
    },
    [
        JSC.integer(10),
        JSC.integer(20)
    ],
    function (a, b) {
        if (a < b) {
            return 'lt';
        } else if (a === b) {
            return 'eq';
        } else {
            return 'gt';
        }
    }
);

```

and get output like (from teaspoon)

    Less than
    Less than Less than 3,1 (1, 0, 1)
    failed
        at Object.<anonymous> (http://localhost:3000/assets/support/jscheck_qunitify.js?body=1:7:27)
        at Object.Test.run (http://localhost:3000/assets/qunit/1.14.0.js:1298:23)
        at http://localhost:3000/assets/qunit/1.14.0.js:1464:16
        at process (http://localhost:3000/assets/qunit/1.14.0.js:1017:29)
        at http://localhost:3000/assets/qunit/1.14.0.js:187:11
    Less than Less than 8,3 (1, 0, 1)
    failed
        at Object.<anonymous> (http://localhost:3000/assets/support/jscheck_qunitify.js?body=1:7:27)
        at Object.Test.run (http://localhost:3000/assets/qunit/1.14.0.js:1298:23)
        at http://localhost:3000/assets/qunit/1.14.0.js:1464:16
        at process (http://localhost:3000/assets/qunit/1.14.0.js:1017:29)
        at http://localhost:3000/assets/qunit/1.14.0.js:187:11
    Less than Less than 2,1 (1, 0, 1)
    failed
        at Object.<anonymous> (http://localhost:3000/assets/support/jscheck_qunitify.js?body=1:7:27)
        at Object.Test.run (http://localhost:3000/assets/qunit/1.14.0.js:1298:23)
        at http://localhost:3000/assets/qunit/1.14.0.js:1464:16
        at process (http://localhost:3000/assets/qunit/1.14.0.js:1017:29)
        at http://localhost:3000/assets/qunit/1.14.0.js:187:11
    
    ...
    
    JSCheck Result
    100 cases: 79✓, 21✗, 0 lost (1, 0, 1)
    Some JSCheck cases failed


# Contributions
Are welcome by pull request.

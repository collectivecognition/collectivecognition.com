---
layout: post
---

A quick introduction to implementing mock-HTTP backends in angular.js, a great technique that can help development in the absense of a backend, offline development, end-to-end testing and more.

Include both `angular` and the `angular-mocks` library:

    <script src="js/lib/angular.js"></script>
    <script src="js/lib/angular-mocks.js"></script>

Conditionally inject `angular-mocks` into your application module. I like to configure things this way to allow easily switching between live and mock backends when developing, testing, etc..

    CONFIG = {
        useMocks: true
    };

    var yourApp = angular.module("YourApp", [CONFIG.useMocks ? "ngMockE2E" :function(){ }]);

Now, let's intercept some HTTP requests! 

    yourApp.run(["$httpBackend", function($httpBackend){
        if(CONFIG.useMocks){

            // Respond to requests to `/foo` with `{"foo": "bar"}`:

            $httpBackend.whenGET(/^\/foo$/).respond(function(method, uri, body){
                    return [200, {
                        foo: bar
                    }];
                });

            // Respond to requests to `/foo/ABC` with `{"foo": "ABC"}`:
            // Also throw an exception if the passed value is too short

            $httpBackend.whenGET(/^\/foo/\w+$/).respond(function(method, uri, body){
                    body = JSON.parse(body);
                    
                    if(body.foo.length > 2){
                        return [200, {
                            foo: body.foo
                        }];
                    }

                    return [500, "There was an error!"];
                });
        }
    }]);
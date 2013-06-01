---
layout: post
---
Generally, ID generation schemes fall into one of two camps: sequential and random. 

Sequential provide obvious ease of implementation, where a random scheme will provide non-guessable IDs and a more complicated implementation due to the need to protect against collisions.

One alternative that can give some of the best of both worlds is to use a hybrid approach where you generate sequential IDs, but encrypt them for display to the end-user using a non-trivial one-way encryption algorithm such as (skip32)[https://npmjs.org/package/skip32].

A sample implementation using node.js is below:

	var skip32 = new require("skip32").Skip32;
	skip32 = new skip32([0x9b, 0x21, 0x96, 0xe, 0x1a, 0xcf, 0x24, 0x5f, 0x14, 0x93]);
	
	var id = 0;
	var generateID = function(callback){
		id++;
		return(skip32.encrypt(id).toString(16));
	}
---
layout: post
---
I've added a new <a href="/games">games</a> page to house my various game projects.

The first entry is Zenbox, a minimalist puzzle game I created for the latest <a href="http://www.ludumdare.com">Ludum Dare</a> 48 hour game development challenge.

All things considered, I think it came out well. Due to some unexpectedly awesome weather I decided to go camping the night before the competition, losing quite a few valuable hours. As there's no cell service where I was camping, I wasn't aware of the theme until getting back home which cost me even more hours spent brainstorming a game concept that fit the theme. Luckily the theme turned out to be an easy one: minimalism.

The first entry in Google for minimalism is a Wikipedia page, a short way down that page is an entry on Zen Buddhism. It wasn't a huge leap of logic from there to the idea of a Zen garden / sandbox.

I had the basic gameplay stubbed out and graphics done by midnight on the first day and got some sleep, leaving most of the bigger challenges to deal with on the second day, including coming up with what the win conditions for the puzzle would be and all of the polish required to make the thing actually playable / enjoyable.

From a code perspective, the most difficult bit was definitely the loop detection algorithm which reminds me a bit of one of those tricky job interview questions involving linked lists. Had I been more organized from the start (as always) this probably would have been cleaner, but I'm happy with the result.

The controls were also quite tricky to nail down, and although I'm not 100% happy with the result they are very usable (if fiddly) and are definitely a huge improvement on the first few iterations I tried, which included keyboard-only navigation.

One interesting challenge with this project was making sure that all scenarios were actually completable, while still being at least somewhat challenging. In an early version of the game I discovered (with some help from my fiance) that the puzzle was actually impossible to complete with an odd number of spaces on the board! The fix for this was easy enough: use only stones which occupy an even number of squares, but it's a good idea of the sort of non-intuitive bits of logic required by puzzle and game design in general.

I'd recommend Ludum Dare to anyone who wants to stretch their game / software design and development muscles in a fun, intensive burst and participate in an awesome community. I'll definitely be taking part when the next competition starts in four months.
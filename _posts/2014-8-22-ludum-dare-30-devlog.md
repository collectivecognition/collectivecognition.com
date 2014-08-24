---
layout: post
---

8:30PM: Waiting...
------------------

1. Blog post started. Check.
2. Latest version of Unity installed. Check.

Now to wait for the theme to be announced!

8:00AM: Beginnings
------------------

I brainstormed until about 11 last night and landed on a few vague ideas, but decided it would be better to get a fresh start in the morning.

After having a nice sleep I've decided on a nautical theme, with the player sailing between islands / continents. Think the Old World and the New World, connecting them with seafaring trade routes.

I'm going to try to keep the look of the game as simple as possible so I can concentrate on the core gameplay, physics, etc.. Behold, the very first screenshot! Doesn't look like much, but I've got some basic buoyancy physics going which I think look pretty decent in action.

<a href="/images/blog/original/ludum-dare-30-1.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-30-1.jpg"></a>

9:00AM: Quick Update
--------------------

Just a quick update to show some progress in the graphical style. I've pretty much decided on a wind movement mechanic which I'm going to start on as soon as I get back from doing some grocery shopping.

<a href="/images/blog/original/ludum-dare-30-2.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-30-2.jpg"></a>

11:30AM: Wind!
--------------

I've made a bit of progress on a wind system and added some basic manual controls.

<a href="/images/blog/original/ludum-dare-30-3.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-30-3.jpg"></a>

3:30PM: Slow Progress
---------------------

The game is progressing slowly but I'm definitely making progress. I've got some basic world generation to generate random islands, a simple ship model with simulated cloth sails and have made a bunch of tweaks to the controls and the physics.

Next up will be adding some user interface stuff so I can start to flesh out some actual gameplay.

<a href="/images/blog/original/ludum-dare-30-4.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-30-4.jpg"></a>

5:00PM: UI Work
---------------

I've updated to Unity 4.6 to get access to the new UI system, which burned a bit of time. On the up side, it's MUCH easier to get up and running than the old system so I think I'll make up the lost time with increased efficiency.

I designed added an event dialog which will enable a lot of the gameplay features I'm planning to be added rapidly.

Time for a short dinner / excercise break!

<a href="/images/blog/original/ludum-dare-30-5.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-30-5.jpg"></a>

10:00PM: Flags!
---------------

The most obvious thing I've added in the last 3 or so hours since dinner is the flags which pop up when you encounter an island for the first time. These will serve to help you keep track of which islands you've already been to in order to encourage exploration.

When colliding with a new island, the flag will pop up (accompanied by an animation and a particle effect) and a random event will occur.

I spent an inordinate amount of time playing with cloth physics for the flags but I think it looks cool enough to be worthwhile AND I had an excuse to learn a Unity system I wasn't really familiar with before.

I did lots and lots of refactoring and tweaking throughout the game as well, so I think things will progress quickly for the remainder of the evening.

<a href="/images/blog/original/ludum-dare-30-6.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-30-6.jpg"></a>

1:30PM: Sleep
-------------

I've completed a bunch of stuff, including:

+ Revamped the water texture, physics and animation
+ Adjusted the lighting
+ Ironed out a bunch of kinks with the flags
+ Added particle effects for the ship wake
+ Revamped the ship controls
+ Completed a basic implementation of the random event system

Time to get some sleep and hit this fresh in the morning!

<a href="/images/blog/original/ludum-dare-30-7.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-30-7.jpg"></a>

9:30AM: Quick Update
--------------------

I've been up 'n at it for a couple hours now. I've modelled the "home" island, where the game starts and done a lot of the event / story writing. 

I'm going to keep this short so I can get back to work!

<a href="/images/blog/original/ludum-dare-30-8.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-30-8.jpg"></a>

11:30AM: More Writing & Some UI
-------------------------------

<a href="/images/blog/original/ludum-dare-30-9.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-30-9.jpg"></a>

TODO
----

+ Hover effect for event buttons
+ Better sail animation
+ Compass
+ Title screen (drifting letters)
+ Sound effects
    * Discover island
+ Fix island collisions
+ Sky
+ Fix flicker of water
+ Starting story line
+ Inventory
+ Crew
+ Food
+ Gold
+ NICE: Edge of world (darker water)

Events
------

+ Intro
+ Win
+ Lose (no crew)
+ Desertion (no gold to pay, lose 1 crew, give names)
+ Starve (no food to feed, lose 1 crew, give names)
+ Poisoned (lose 1 crew)
+ Find spice A-D
+ Gain 1 crew
+ Lose 1 crew
+ Gain gold
+ Lose gold
+ Gain food
+ Spoiled

Tools
-----

+ [NeoTextureEdit](http://neotextureedit.sourceforge.net/) for the water texture
+ [Silo](http://silourl) for polygon modelling

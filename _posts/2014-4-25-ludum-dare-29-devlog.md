---
layout: post
---

9:05PM: Initial Ideas
---------------------

The theme is Beneath The Surface. My initial thoughts:

- Asteroid mining (something like Dig Dug or Mr Driller?)
- Ocean exploration (fishing?)
- Oil drilling (a puzzle game maybe?)
- Peeling vegetables (could be a good use of touch controls!)
- Exploring the human psyche (psychologist simulator?)
- Crypt / tombs / catacombs (filling up with water maybe?)
- Mine carts (procedurally generated tunnels?)

9:22PM: Choosing An Idea
------------------------

There were a lot of space-type themes in the final list so I was already thinking along these lines before the final theme was chosen.

I think I have to go with asteroid mining. I'm imagining something like a combination of Lunar Lander and the classic Asteroids. Unity should be able to handle most of the physics "heavy lifting" and as long as I stick to a simple graphical style, I think I might be able to pull this off.

Some initial thoughts:

- I want this to work on mobile devices, so touch-friendly controls are a must. 
- I'd like travel between asteroids to be zoomed out, with the camera zooming in for landing
- Parallax stars would be cool for the background

Time to start coding!

10:22PM: Basic Physics / Controls
---------------------------------

I've got a placeholder ship sprite and a basic newtonian physics control setup which allows attitude adjustment (rotation) forward / reverse thrust and velocity clamping to keep things sane.

	using UnityEngine;
	using System.Collections;

	public class ShipControls : MonoBehaviour {
		private float rotatationSpeed = 100.0f;
		private float acceleration = 2.0f;
		private float thrust = 0.0f;
		private float maxVelocity = 2.0f;

		void Update(){
			transform.Rotate (Vector3.forward * (-Input.GetAxis("Horizontal") * rotatationSpeed * Time.deltaTime) ); 

			float inputThrust = Input.GetAxis("Vertical");
			thrust += inputThrust * acceleration;

			Vector3 newForce = Vector3.up * thrust * Time.deltaTime;
			Vector3 relativeForce = transform.InverseTransformDirection(newForce);
			rigidbody2D.AddForce(new Vector2(relativeForce.x * -1f, relativeForce.y));

			rigidbody2D.velocity = Vector3.ClampMagnitude(rigidbody2D.velocity, maxVelocity);

			Debug.DrawLine (transform.position, transform.position + Vector3.up * 2f, Color.red);
		}

		void OnGUI(){
			GUI.Label(new Rect(10, 10, 100, 25), "Thrust: " + thrust);
		}
	}

<a href="/images/blog/original/ludum-dare-29-1.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-29-1.jpg"></a>

10:40PM: Wrestling With Blog
----------------------------

Grr! My blog publishing scripts are giving me trouble. Mental note: sort this sort of thing out BEFORE the compo next time.

11:05PM: So Very Tired
----------------------

I've done some more "miner" tweaking, but as it's been a very long day and I'm having trouble keeping my eyes open, I think I'll get some sleep and hit the ground running in the morning.

A few notes on my current thoughts for the direction of the game:

- Randomly place asteroids around level
- Place "ore" nuggets randomly within asteroids
- Ship must fly by and scan for these ore nuggest
- After locating an ore nugget, player must land on asteroid surface perpendicular to nugget and drill straight down to retrieve it

6:68AM: Wakey Wakey
-------------------

My significant other had a brilliant idea in her dreams: Beaneath the Surfers, a game about surfers avoiding being eaten by sharks. If only LD was twice as long!

Back to work :D

8:07AM: Camera
--------------

I've made a bit of progress with an auto-zooming camera that makes sure you can always see at least one asteroid. It's glitchy, but basically functional so I'm going to shift gears and work on some scanning code.

	public class Asteroid : MonoBehaviour {
		public bool IsVisible(){
			Vector3 viewPos = Camera.main.WorldToViewportPoint(transform.position);

			if(viewPos.x < 0 || viewPos.x > 1 || viewPos.y < 0 || viewPos.y > 1){
				return false;
			}

			return true;
		}
	}

9:20AM: Scanner
---------------

I have a basic scanner system in place. Scanner is triggered by holding down the mouse button and then aimed with the mouse. Ore that is "scanned" will become visible.

<a href="/images/blog/original/ludum-dare-29-2.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-29-2.jpg"></a>

10:40AM: Level Generation
-------------------------

Lots of tweaks / additions in the last hour.

- Implemented a basic level generator that places asteroids and adds ore to them.
- Re-wrote camera zooming system to simply toggle between zoom levels based on the distance the closest asteroid. This works MUCH better than the more elaborate system.
- Tweaked ship controls to make the physics more manageable.

The next task will be adding support for landing on asteroids (and destroying the ship if you come in too fast / upside down /etc..), which is probably going to be one of the trickiest bits of code in the game.

All in all, things are progressing nicely and I have decent confidence I'll be able to finish SOMETHING to submit tomorrow.

<a href="/images/blog/original/ludum-dare-29-3.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-29-3.jpg"></a>

11:32:AM: Lunch Break!
----------------------

I got a little distracted and added animated thrusters to indicate the direction / intensity of thrust and also tweaked the physics a bit.

Most of the core mechanics are in place, except "mining" the ore and collisions, so I think this is a good stopping point to take a break and go grab some lunch.

<a href="/images/blog/original/ludum-dare-29-4.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-29-4.jpg"></a>
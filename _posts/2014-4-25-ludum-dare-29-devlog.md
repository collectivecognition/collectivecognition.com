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

11:32AM: Lunch Break!
----------------------

I got a little distracted and added animated thrusters to indicate the direction / intensity of thrust and also tweaked the physics a bit.

Most of the core mechanics are in place, except "mining" the ore and collisions, so I think this is a good stopping point to take a break and go grab some lunch.

<a href="/images/blog/original/ludum-dare-29-4.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-29-4.jpg"></a>

2:24PM: Lots of Updates
-----------------------

Had a nice long lunch (Korean pork bone soup) and then got a ton of work done!

Highlights are a bunch of graphics updates, including parallax backgrounds and new asteroids.

I also re-wrote the ore distribution code to place the ore realistically beneath the uneven surface of the asteroids by picking. Quick code sample to illustrate the technique:

	public class Asteroid : MonoBehaviour {
		public GameObject orePrefab;

		private float minDepth = 0.1f;
		private float maxDepth = 0.5f;
		private int minOre = 2;
		private int maxOre = 20;

		// Initialize a new asteroid

		public void Start(){

			// Generate a random number of ore, within the specified range

			int numOre = Random.Range(minOre, maxOre);

			for(int ii = 0; ii < numOre; ii++){

				// Instantiate a new ore object and parent it to the asteroid

				GameObject ore = (GameObject)Instantiate(orePrefab);
				ore.transform.parent = gameObject.transform;

				// Pick a random point along the outside of the asteroid collider

				PolygonCollider2D p = (PolygonCollider2D)collider2D;
				Vector2 randomPoint = p.points[Random.Range (0, p.points.Length)];

				// Move it to a random depth in the specified range

				float randomDepth = Random.Range(minDepth, maxDepth);
				randomPoint = Vector2.Lerp(randomPoint, Vector2.zero, randomDepth);

				// Set position of ore, making sure to place it's z in front of the asteroid

				Vector3 randomPos = new Vector3(randomPoint.x, randomPoint.y, -0.0001f);
				ore.transform.localPosition = randomPos;
			}
		}
	}

<a href="/images/blog/original/ludum-dare-29-5.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-29-5.jpg"></a>

4:19PM: Slow Going
------------------

Physics are turning into a pain in the butt (as per usual), so I've wasted a good amount of time tweaking those and I'ms till not 100% happy with the controls.

I did manage to throw in a nice explosion animation when the ship collides with an asteroid and a system for breaking the ship up into it's component parts and applying random forces to them so they drift / spin away during the explosion. It looks pretty cool!

<a href="/images/blog/original/ludum-dare-29-6.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-29-6.jpg"></a>

5:04PM: More Tweaking
---------------------

I've finally got the physics and controls in a place I'm happy with, and a solid idea of where I want the rest of the gameplay to go.

I'm going to replace the scanning beam with more of a "pulse" which gets sent out in all directions at intervals. The scanning beam will be repurposed as a sort of mining tractor beam and become the mechanism by which the player retrives ore.

Time to think about some dinner, do a few errands around the house and finish plotting my next steps.

7:06PM: Scanning
----------------

I've revamped the scanning system and played with a lot of the graphics and small subsystems. Things are going slowly but surely. I think I'll be able to have all the core gameplay finished before I go to bed, leaving all day tomorrow for polishing, playtesting, sound effects and finishing touches like menus, etc..

<a href="/images/blog/original/ludum-dare-29-7.jpg" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-29-7.jpg"></a>

8:30PM: Version Control
-----------------------

Remember, friends don't let friends develop without using version control! Set up a git repo for the project so I can start tracking changes after a small scare with some changes causing a nasty crash.

The mining beam is coming along nicely, should have a working prototype soon.
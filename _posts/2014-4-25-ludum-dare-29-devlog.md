---
layout: post
---

9:05PM: Initial Ideas
=====================

The theme is Beneath The Surface. My initial thoughts:

- Asteroid mining (something like Dig Dug or Mr Driller?)
- Ocean exploration (fishing?)
- Oil drilling (a puzzle game maybe?)
- Peeling vegetables (could be a good use of touch controls!)
- Exploring the human psyche (psychologist simulator?)
- Crypt / tombs / catacombs (filling up with water maybe?)
- Mine carts (procedurally generated tunnels?)

9:22PM: Choosing An Idea
========================

There were a lot of space-type themes in the final list so I was already thinking along these lines before the final theme was chosen.

I think I have to go with asteroid mining. I'm imagining something like a combination of Lunar Lander and the classic Asteroids. Unity should be able to handle most of the physics "heavy lifting" and as long as I stick to a simple graphical style, I think I might be able to pull this off.

Some initial thoughts:wd

- I want this to work on mobile devices, so touch-friendly controls are a must. 
- I'd like travel between asteroids to be zoomed out, with the camera zooming in for landing
- Parallax stars would be cool for the background

Time to start coding!

10:22PM: Basic Physics / Controls
=================================

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

<a href="/images/blog/original/ludum-dare-29-1.png" rel="shadowbox"><img src="/images/blog/thumbnails/ludum-dare-29-1.png"></a>
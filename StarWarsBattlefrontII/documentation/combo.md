```C#
// Combo file format and template

//RemapReloadButton("<button>");
//		Since the reload button is generally unused by combo weapons, allow
//			it to be remapped for the soldier.
//		<button> string param; values:
//			"Fire"			- Fire button
//			"FireSecondary"	- Secondary fire button
//			"Jump"			- Jump button
//			"Sprint"		- Sprint button
//			"Crouch"		- Crouch button
//			"Reload", "None"- Don't remap the reload button
RemapReloadButton("FireSecondary");	// remap to FireSecondary so we can use the second trigger for our own purposes

//Animation("<animname>")
//{}	scope OPTIONAL
//		Defines a combo animation by name to be used below.
//			Since combo animations have custom names, it is sometimes
//			necessary to define them ahead of time so that they can be
//			referenced later in the file.
//		<animname> string param; values: any, does not include a bank name
//			(i.e. without "human_sabre_") and may optionally exclude the
//			the animation scope ("_upper" or "_lower"), in which case both
//			animation scopes are affected.
//		[scope] contains animation data in the same format as the .sanm file.
//			If not present, this tag will simply act as a forward declaration.
Animation("stand_attack1a_end");// forward declare "stand_attack1a_end_upper" 
								// and "stand_attack1_end_lower"
Animation("stand_attack1a")		// declare "stand_attack1a_upper"/"lower"
								// with the following data:
{
	//Loop([bLoop]);
	//		Set whether this anim loops; defaults to not looping.
	//		[bLoop] OPTIONAL numeric param; default 1; values: 0, 1
	//		Also may be "FinalFrame" to loop just the last frame.
	Loop();

	//AimType("<aimtype>");
	//		Set the aiming behavior of this anim; defaults to "None".
	//			NOTE: only used by "_upper" anim scope.
	//		<aimtype> string param; values:
	//			"None"		- body oriented in move direction
	//			"Head"		- body in move direction, head turned to aim
	//			"Torso"		- body in move direction, torso turned to aim
	//			"FullBody"	- body in aim direction, override walk/run anims
	AimType("FullBody");

	//SyncType("<name>"[, "ByTime"]);
	//		Sets the sync class of this anim; defaults to no sync class.
	//			When transitioning between two anims in the same sync class,
	//			the new anim will frame sync to the old.
	//		<name> string param; values: any
	//		"ByTime" if specified, sync to same time as previous anim instead
	//			of to same ratio of anim length.
	SyncType("forward");

	//BlendInTime(<time>[, "Frames"|"Seconds"]);
	//		Sets the blend in time of this anim; defaults to 0.0.
	//		<time> numeric param; value in seconds [0.00 - 2.55]
	//		"Frames" specifies that time is in frames.
	BlendInTime(0.15);

	//BlendOutTime(<time>[, "Frames"|"Seconds"]);
	//		Sets the blend out time of this anim; defaults to 0.0.
	//		<time> numeric param; value in seconds [0.00 - 2.55]
	//		"Frames" specifies that time is in frames.
	BlendOutTime(0.15);

	//BlendTimeTo("<animname>", <time>[, "Frames"|"Seconds"]);
	//		Sets the specific blend time from this anim to another, by name.
	//			If no specific blend time exists, the blend time will be set
	//			to the minimum of this anim's BlendOutTime and the destination
	//			anim's BlendInTime.
	//		<animname> string param; values: previously defined animnames.
	//			All basic movement, action, and weapon animations are defined
	//			as well as any animations previously defined in this file with
	//			an Animation() tag.  Animation scope (i.e. "_upper") is ignored.
	//		<time> numeric param; value in seconds [0.00 - 2.55]
	//		"Frames" specifies that time is in frames.
	BlendTimeTo("stand_attack1a_end", 0.00);

	//LowResPose(<time>[, "Frames"|"Seconds"]);
	//		If specified, this animation will be reduced to a single pose
	//		generated from frame <time> when animating low res models.
	//		NOTE: currently this only applies to attack and block anims.
	//		<time> numeric param; value in seconds [0.00 - 2.55]
	//		"Frames" specifies that time is in frames.
	LowResPose(5, "Frames");
}

//State("<statename>")
//{}	scope REQUIRED
//		Defines a state in the combo. 
//		<statename> is used to reference this state elsewhere in the file.
//		NOTE: all combos must define an initial state called "IDLE"
State("ATTACK1")
{
	//RestartAnimation();  no parameters - tag to tell the system to restart the animation 
	//			if coming in from the same one, rather than continuing it.
	RestartAnimation();

	//PlayExplosion();  no parameters - tag to tell the system to play the WeaponMelee's 
	//			Explosion, if it has one set.
	PlayExplosion();

	//MustShowOneFrame(); will not exit this state to another without displaying at least
	//			one frame of the soldier's animation for it - which is enough
	//			to allow them to jump, etc, before transitioning.
	MustShowOneFrame();

	
	//Duration(<time>[, "FromAnim"|"Frames"|"Seconds"]);
	//		Sets the duration of this state; defaults to the anim duration.
	//		<time> numeric param; value in seconds by default [0.00-10.22]
	//			0.0 means infinite
	//		"FromAnim" if specified, duration is a percentage of anim duration.
	//		"Frames" if specified, duration is in frames (30ths of seconds).
	//		"Seconds" if specified, duration is in seconds.
	Duration(-1);	// use anim duration

	//Animation("<animname>")
	//{}	scope OPTIONAL
	//		Sets the animation associated with this state; defaults to no anim.
	//			Also defines a combo animation by name as above.
	Animation("stand_attack1a");

	//Sound("<soundname>" [, <time>][, "Frames"|"Seconds"]);
	//		Sets the sound played with this state; defaults to no sound.
	//		[time] numeric param; default 0.00; value in seconds: [0.00-10.23]
	//			Sets the time from the start of the state to play the sound.
	//		"Frames" specifies that the time value is in frames.
	Sound("imp_weap_lightsabre", 0.00);

	//AnimatedMove([set])
	//{}	scope OPTIONAL
	//		If set, the animation will control the soldier's velocity for the
	//			duration of this state; defaults to false.
	//		[set] numeric param; default 1; values: 0, 1
	//		[scope] contains conditions to disable AnimatedMove
	AnimatedMove()
	{
		//VelocityZ(<velocity>[, "FromAnim"]);
		//		Sets the override z velocity for this animated move; defaults
		//			to the animation velocity (1.0, "FromAnim");
		//		<velocity> numeric param; value in meters per second; 
		//			[-40.96-40.94]
		//		"FromAnim" if specified, interpret <velocity> as a multiplier
		//			to apply to the animation velocity.
		VelocityZ(1.0, "FromAnim");		// use animation velocity z

		//VelocityX(<velocity>[, "FromAnim"]);
		//		Sets the override x velocity for this animated move; defaults
		//			to the animation velocity (1.0, "FromAnim");
		//		<velocity> numeric param; value in meters per second; 
		//			[-40.96-40.94]
		//		"FromAnim" if specified, interpret <velocity> as a multiplier
		//			to apply to the animation velocity.
		VelocityX(1.0, "FromAnim");		// use animation velocity x

		//VelocityFromThrust(<velocity>);
		//		Sets the thrust dependent (z) velocity for this animated move;
		//			defaults to 0.0.  Multiplied by input thrust (-1 - 1).
		//		<velocity> numeric param; value in meters per second;
		//			[0.00-12.75]
		VelocityFromThrust(0.0);

		//VelocityFromStrafe(<velocity>);
		//		Sets the strafe dependent (x) velocity for this animated move;
		//			defaults to 0.0.  Multiplied by input strafe (-1 - 1).
		//		<velocity> numeric param; value in meters per second;
		//			[0.00-12.75]
		VelocityFromStrafe(0.0);

		//Until/If/Or()
		//{}	scope REQUIRED
		//		Defines a condition to break out of AnimatedMove.
		//			All conditions are forced to breaking conditions.
		//		See Transition::If/Or below for details.
		Until()	// break out after 0.2 seconds if stick is moved
		{
			Break(0.2);
			Thrust(">", 0.5477);
		}
	}

	//AlignedToThrust([0|1|"Initial"]);
	//		Sets this state to align its aim and VelocityFromThrust direction 
	//			to the input thrust direction; defaults to 0.
	//		[0|1] numeric or string param; default 1; values: 0, 1, "Initial"
	//			"Initial" causes this state to align to the initial thrust
	//				direction (i.e. the direction the thrust pointed in when
	//				entering this state).
	AlignedToThrust(0);

	//Gravity(<gravity>);
	//		Sets the gravity during this state in g's; default is 1.0.
	//		<gravity> numeric param; value [-12.7 - 12.7]
	Gravity(1.0);

	//GravityVelocityTarget(<velocity>[, "Impulse"][, "ZeroGravity"]);
	//		Sets a (Y) velocity condition on the Gravity setting; default
	//			is no condition.
	//		<velocity> numeric param; value [-204.7 - 204.7] meters per second.
	//		"Impulse" if specified, instantly accelerate to target velocity.
	//		"ZeroGravity" if specified, gravity resets to 0.0 instead of 1.0
	//			once the velocity condition is met.
	GravityVelocityTarget(0.0);

	//InputLock([<duration>[, "Frames"|"Seconds"]][, "<control>"][, ...]);
	//		Sets the combo to lock controls from going to the soldier in 
	//			this state; defaults to none.
	//		[duration] OPTIONAL numeric param; default 0.0; value in seconds 
	//			[0.00-10.23].  0.0 or negative means entire state duration.
	//		"Frames" specifies that the duration is in frames.
	//		[control] OPTIONAL string param; default "All"; values:
	//			"All", "Any"	- All controls
	//			"Thrust"		- Thrust stick
	//			"Fire"			- Fire button
	//			"FireSecondary"	- Secondary fire button
	//			"Jump"			- Jump button
	//			"Sprint"		- Sprint button
	//			"Crouch"		- Crouch button
	//			"Reload"		- Reload button
	//			"!<control>"	- except a control
	//				i.e. InputLock(0.0, "All", "!Thrust", "!Sprint");
	//				locks all controls except Thrust and Sprint
	InputLock();			// lock all controls for duration of state

	//ThrustFactor(<factor>);
	//		Set a multiplier to apply to the thrust control while in this state;
	//			defaults to 1.0.  Note that while InputLock("Thrust") is active,
	//			the thrust factor will effectively be 0.0.
	//		<factor> numeric param; value [0.00-12.75]
	ThrustFactor(1.0);		// default thrust speed

	//StrafeFactor(<factor>);
	//		Set a multiplier to apply to the strafe control while in this state;
	//			defaults to 1.0.  Note that while InputLock("Thrust") is active,
	//			the strafe factor will effectively be 0.0.
	//		<factor> numeric param; value [0.00-12.75]
	StrafeFactor(1.0);		// default strafe speed

	//TurnFactor(<factor>);
	//		Set a multiplier to apply to the turn control while in this state;
	//			defaults to 1.0.
	//		<factor> numeric param; value [0.00-12.75]
	TurnFactor(1.0);		// default turn speed

	//PitchFactor(<factor>);
	//		Set a multiplier to apply to the pitch control while in this state;
	//			defaults to 1.0.
	//		<factor> numeric param; value [0.00-12.75]
	PitchFactor(1.0);		// default pitch speed

	//Posture("<posture>"[, "<posture>"][, ...]);
	//		Sets the soldier postures allowed in this state; defaults to "All"
	//			The soldier will be forced into one of the postures, if
	//			possible, and will abort to IDLE state if not.
	//		<posture> string param; values:
	//			"All", "Any"	- All postures
	//			"Stand"			- soldier is standing
	//			"Crouch"		- soldier is crouching
	//			"Prone"			- soldier is prone
	//			"Sprint"		- soldier is sprinting
	//			"Jump"			- soldier is jumping
	//			"RollRight"		- soldier is rolling to the right
	//			"RollLeft"		- soldier is rolling to the left
	//			"Jet"			- soldier is jet jumping
	//			"Roll"			- synonym for "RollLeft","RollRight"
	//			"!<posture>"	- except a posture
	Posture("Stand");		// must be standing

	//TurnOffLightsaber([weapon#][, weapon#][, ...]);
	//		Causes the lightsabers specified to be turned off while in this
	//			state.  Default is all sabers on.
	//		[weapon#] int param; values [0-3]; the weapon indices from the
	//			melee weapon odf of the lightsabers to turn off.
	//			If no [weapon#] are specified, all will be turned off.
	//TurnOffLightsaber(1);	// turn off lightsaber 1

	//EnergyRestoreRate([rate][, "FromSoldier"]);
	//		Sets the soldier energy restore rate in this state; defaults to
	//			normal soldier energy restore rate in current posture
	//			(0.0, "FromSoldier").
	//		[rate] OPTIONAL numeric param; default 0.0, "FromSoldier"; 
	//			value in energy per second [-102.2-102.2], may be negative
	//		"FromSoldier" if specified, apply <rate> as an offset from the
	//			normal energy restore rate.  Otherwise, use <rate> as an
	//			absolute rate.
	EnergyRestoreRate(0.0);	// do not restore energy while attacking

	//Attack()
	//{}	scope OPTIONAL
	//		Define attack (damage) parameters for this state; default none.
	//			Multiple Attack's may be defined per state.
	//		[scope] contains data defining this attack; defaults to an attack
	//			with default parameters.
	Attack()
	{
		//AttackId(<id>);
		//		If two attacks within a short period of time share the same 
		//			AttackId, only the first to apply damage to a character 
		//			will do damage.  This is useful for splitting one attack
		//			across multiple states without potentially creating 
		//			double damage.
		//		<id> string param; arbitrary value.
		AttackId("attack1");

		Edge(<index>);
		//		Specify which edge this damage is attached to, if this 
		//			character has multiple blades defined in their weapon odf;
		//			default is 0.
		//		<index> numeric param; value [0-<numedges-1>]
		Edge(0);

		//DamageTime(<time0>, <time1>[, "<option>"]);
		//		Sets the time range from the start of the state during which 
		//			damage will be applied; defaults to 0.2-0.3 FromAnim.
		//		<time> numeric param; value in seconds by default
		//		[option] string param; values:
		//			"Seconds"	- <time> is in seconds
		//			"Frames"	- <time> is in frames (1/30ths of a second)
		//			"FromAnim"	- <time> is fraction of state duration in 
		//							the range [0.0-1.0]
		DamageTime(2, 5, "Frames");	// do damage from frame 2 to 5

		//Damage([damage]);
		//		Sets the damage inflicted by this attack; defaults to the value
		//			set in the weapon odf with "Damage" or "MaxDamage".
		//		<damage> numeric param; value in health units. [0-4094]
		//			or "Default" for weapon odf value.
		Damage(200);

		//Push(<strength>);
		//		Sets the push effect strength inflicted by this attack; 
		//			defaults to 0.0.
		//		<strength> numeric param; value in meters per second [0.0-25.5].
		Push(0.0);

		//DamageLength(<length>[, "FromEdge"]);
		//		Sets the length of the ray used for applying damage; 
		//			defaults to 1.0 FromEdge.
		//		<length> numeric param; value in meters by default [0.0-10.23]
		//		"FromEdge" if specified, the distance is a multiplier on the
		//			edge length specified in the weapon odf.
		DamageLength(1.0, "FromEdge");

		//DamageWidth(<width>,[, "FromEdge"]);
		//		Sets the width of the ray used for applying damage; 
		//			defaults to 1.0 FromEdge.
		//		<length> numeric param; value in meters by default [0.0-2.55]
		//		"FromEdge" if specified, the distance is a multiplier on the
		//			edge width specified in the weapon odf.
		DamageWidth(1.0, "FromEdge");
	}

	//Deflect()
	//{}	scope REQUIRED
	//		Enables ordnance deflection in this state; defauls to none.
	//			Only one Deflect may be defined per state, currently.
	//		[scope] contains deflection parameters.
	Deflect()
	{
		//DeflectAngle(<min>, <max>);
		//		Only attacks in directions within this angular range in the
		//			XZ plane can be deflected.  defaults to all directions.
		//		<min> numeric param; value in degrees [-180-180]
		//		<max> numeric param; value in degrees [-180-180]

		//EnergyCost(<energy>);
		//		Sets the energy cost per attack deflected; defaults to 0.0.
		//		<energy> numeric param; value in energy units [0.0-102.3]
		EnergyCost(0.0);

		//DeflectAnimation("<animname>"[, "<direction>"][, ...][, "Offhand"])
		//{}	scope OPTIONAL
		//		Sets a deflection pose to use when an attack is deflected in
		//			a given approximate direction.  If multiple animations
		//			match an incoming attack's direction, one will be randomly
		//			selected.  If none match, the first anim will be used.
		//		<animname> as in Animation tags above.
		//		[direction] string param; values one or more of:
		//			"Forward", "Right", "BackRight",
		//			"Left", "BackLeft", "Back"
		//			"All"			- match any direction
		//			"!<direction>" - disable a direction, useful with "All"
		//		"Offhand" if specified, this is a lefthanded block - use the
		//			left hand or damage edges when attaching effects.  Note
		//			that if you have moved a right handed lightsaber to the
		//			left hand by moving hp_weapons, it still counts as right
		//			handed.
		//		[scope] as in Animation tags above.
		DeflectAnimation("stand_block_front1", "Forward");
		DeflectAnimation("stand_block_right1", "Right");
		DeflectAnimation("stand_block_left1", "Left");
	}

	//Transition("<statename>")
	//{}	scope OPTIONAL
	//		Define a transition from this state to another by name;
	//			if no transitions are defined, defaults to an unconditional
	//			transition to IDLE at the end of this state's Duration.
	//			Multiple Transition's may be defined per state, in which case
	//			the final Transition is also considered to be an unconditional
	//			non-breaking transition if no other such transition is defined.
	//		<statename> string param; values: any statename defined elsewhere
	//			in this file by a State tag.
	//		[scope] contains data defining this transition; defaults to
	//			an unconditional transition to the given state at the end of
	//			this state's Duration.
	Transition("ATTACK2")
	{
		//EnergyCost(<energy>);
		//		Sets the energy cost of following this transition, which is
		//			effectively also a condition on the soldier energy to 
		//			make this transition; default 0.0.
		//		<energy> numeric param; value in energy units.
		EnergyCost(0.0);

		//If/Or()
		//{}	scope REQUIRED
		//		Defines a condition to be met in order to make this transition;
		//			default is unconditional, non-breaking transition.
		//			Multiple conditions may be defined per transition, in which
		//			case the transition will trigger if any of the conditions
		//			are met (hence the optional tag "Or").
		//		<scope> contains a set of conditions to be met; all conditions
		//			in the scope must be met to trigger this transition.
		If()	// transition if...
		{
			//Break([time][, "Frames"|"Seconds"]);
			//		After [time] seconds, if the rest of this condition is 
			//			met, the transition will break out of the current 
			//			state immediately rather than waiting until the state 
			//			Duration expires.
			//			NOTE: A TimeStart less than the Break time allows a
			//			breaking condition to depend on earlier button events.
			//			A Break time less than TimeStart won't break until
			//			TimeStart.
			//		[time] numeric param; default 0.0; value in seconds.
			//			[0.00 - 5.11].
			//			This condition will not break until [time] seconds
			//			have passed since the start of the state.
			//		"Frames" specifies that the time is in frames.

			//TimeStart(<time>[, "FromEnd"][, "Frames"|"Seconds"]);
			//		Set the time to start checking this condition; defaults to
			//			0.0, the start of the state.  The start time may be
			//			negative or before the start of the state, in which
			//			case button events still stored from the previous 
			//			state may apply.  Button events are checked to see if 
			//			they occurred in the time range defined.  Other 
			//			conditions only check their current value, if the 
			//			current time is in range.
			//		<time> numeric param; value in seconds [-5.12 - 5.11]
			//		"FromEnd" if specified, time is measured from the end
			//			of the current state's Duration.
			//		"Frames" specifies that the time is in frames.
			TimeStart(-1.0);	// accept button hits up to 1 second before

			//TimeEnd(<time>[, "FromEnd"][, "Frames"|"Seconds"]);
			//		Set the time to stop checking this condition; defaults to
			//			0.0, FromEnd, the end of the state.  The end time may 
			//			be after then end of the state, in which case, if the
			//			combo transitions unconditionally, it will continue
			//			checking the condition to retroactively take this
			//			transition.
			//		<time> numeric param; value in seconds [-5.12 - 5.11]
			//		"FromEnd" if specified, time is measured from the end
			//			of the current state's Duration.
			//		"Frames" specifies that the time is in frames.
			TimeEnd(0.15);		// keep checking this condition for 0.15 
								// seconds into RECOVER1

			//Button("<button>"[, "<action>"]);
			//		Set a button event condition to take this transition.
			//		<button> string param; values:
			//			"Fire"			- Fire button
			//			"FireSecondary"	- Secondary fire button
			//			"Jump"			- Jump button
			//			"Sprint"		- Sprint button
			//			"Crouch"		- Crouch button
			//			"Reload"		- Reload button
			//			"FireBoth"		- Fire and FireSecondary together
			//		[action] string param; default "Tap"; values:
			//			"Tap"			- button pressed and released quickly
			//			"DoubleTap"		- button tapped twice quickly
			//			"Hold"			- button pressed, held, and released
			//			"Down"			- button down at any time (matches all 
			//								other actions)
			Button("Fire");		// look for a tap on the fire button

			//ButtonsPressed("<button>"[, "<button>"][, ...]);
			//ButtonsReleased("<button>"[, "<button>"][, ...]);
			//		Set a condition on any of a number of buttons being 
			//			pressed or released.  This condition differs from
			//			Button in the following ways:
			//			It does not consume button events; this makes it
			//				possible to test a button but leave it in the
			//				queue to trigger a transition from the following
			//				state.
			//			It can test multiple buttons simultaneously.
			//			If both ButtonsPressed and ButtonsReleased conditions
			//				are present, they are evaluated collectively; i.e. 
			//				if any button in the ButtonPressed list was 
			//				pressed or any button in the ButtonReleased list 
			//				was released, this part of the condition passes.
			//		<button> string param; values one or more of:
			//			"Fire"			- Fire button
			//			"FireSecondary"	- Secondary fire button
			//			"Jump"			- Jump button
			//			"Sprint"		- Sprint button
			//			"Crouch"		- Crouch button
			//			"Reload"		- Reload button
			//			"All", "Any"	- Any button
			//			"!<button>"		- Remove this button from the list;
			//							  useful with "Any".
			ButtonsPressed("All", "!Reload");	// any button but reload was pressed
			ButtonsReleased("Fire");			// or fire was released

			//Posture("<posture>"[, "<posture>"][, ...]);
			//		Sets a soldier posture condition to take this transition.
			//		<posture> string param; values:
			//			"All", "Any"	- All postures
			//			"Stand"			- soldier is standing
			//			"Crouch"		- soldier is crouching
			//			"Prone"			- soldier is prone
			//			"Sprint"		- soldier is sprinting
			//			"Jump"			- soldier is jumping
			//			"RollRight"		- soldier is rolling to the right
			//			"RollLeft"		- soldier is rolling to the left
			//			"Jet"			- soldier is jet jumping
			//			"Roll"			- synonym for "RollLeft","RollRight"
			//			"!<posture>"	- except a posture
			Posture("Stand");

			//TimeInPosture(">"|"<", <time>[, "Frames"|"Seconds"]);
			//		Sets a soldier posture timer condition to make this
			//			transition. i.e. soldier in "Jump" posture for so
			//			many seconds.
			//		">"|"<"	if "<", condition is less than or equal to,
			//			otherwise, condition is greater than or equal to.
			//		<time> numeric param; value in seconds [0.00 - 20.47].
			//		"Frames" specifies that the time is in frames.
			TimeInPosture(">", 0.00);	// same as no condition

			//Energy(">"|"<", <energy>);
			//		Sets a condition on the soldier energy required to make
			//			this transition.
			//		">"|"<"	if "<", condition is less than or equal to,
			//			otherwise, condition is greater than or equal to.
			//		<energy> numeric param; value in energy [0.0 - 102.3].
			Energy(">", 0.0);			// same as no condition

			//Thrust(">"|"<", <thrust>);
			//		Sets a condition on the input thrust magnitude.
			//		">"|"<"	if "<", condition is less than or equal to,
			//			otherwise, condition is greater than or equal to.
			//		<thrust> numeric param; value [0.00 - 1.00].
			Thrust(">", 0.00);			// same as no condition

			//ThrustAngle(<anglemin>, <anglemax>);
			//		Sets a condition on the input thrust angle in degrees, 
			//			where 0, 360, or -360 is forward, 
			//			90 or -270 is left, -90 or 270 is right, and
			//			180 or -180 is back.
			//		<anglemin> numeric param; value in degrees [-360 - 360]
			//		<anglemax> numeric param; value in degrees [-360 - 360]
			//			<anglemax> should be greater than <anglemin> or
			//			the condition will end up inverted.
			ThrustAngle(0, 0);			// same as no condition

			//VelocityXZ(">"|"<", <velocity>);
			//		Sets a condition on the soldier speed in the XZ direction.
			//		">"|"<"	if "<", condition is less than or equal to,
			//			otherwise, condition is greater than or equal to.
			//		<velocity> numeric param; value in meters per second
			//			[0.00 - 20.47].
			VelocityXZ(">", 0.00);		// same as no condition

			//VelocityXZAngle(<anglemin>, <anglemax>);
			//		Sets a condition on the soldier velocity angle in the XZ
			//			direction in degrees, where 0, 360, or -360 is 
			//			forward, 90 or -270 is left, -90 or 270 is right, and
			//			180 or -180 is back.
			//		<anglemin> numeric param; value in degrees [-360 - 360]
			//		<anglemax> numeric param; value in degrees [-360 - 360]
			//			<anglemax> should be greater than <anglemin> or
			//			the condition will end up inverted.
			VelocityXZAngle(0, 0);		// same as no condition

			//VelocityYAbs(">"|"<", <velocity>);
			//		Sets a condition on the soldier speed in the Y direction.
			//		">"|"<"	if "<", condition is less than or equal to,
			//			otherwise, condition is greater than or equal to.
			//		<velocity> numeric param; value in meters per second
			//			[0.00 - 15.75].
			VelocityYAbs(">", 0.0);		// same as no condition

			//VelocityY(">"|"<", <velocity>);
			//		Sets a condition on the soldier velocity in the Y 
			//			direction, i.e. including sign.
			//		">"|"<"	if "<", condition is less than or equal to,
			//			otherwise, condition is greater than or equal to.
			//		<velocity> numeric param; value in meters per second
			//			[-16.0 - 15.5].
			VelocityY(">", -16.0);		// same as no condition
		}
	}
}
```

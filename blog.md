# BLOG

2023.8.7
what is left to be done???
1. implement "health" state, which derives from "completedHabits" and "totalCompletedHabits." somehow track this state in your app and use it to set the arguments for the heart bar as well as the pet message
2. make sure to create a Goals model
3. implement simple animation for the pet. nothing fancy, but something.
4. implement back end!! and implement being able to save habit data over time. this implies...
5. editing the Habit (and maybe the Goal) model to track habits over time.

2023.8.4
4: your worm is a happy worm
3: thine worm is a contented worm
2: i'm ok.
1: would you still love me if i was your girlfriend 🥺
0: 😵💩

2023.8.1
OK. I have gotten quite a lot done. I've added a worm images for a pet, which sit underneath a health bar than can reach up to 4 hears. There is a button that says "feed me". When you click on it, the bar increments one heart. Very rudimentary but it is the building block for what is to come.

There is much more Udemy course to complete. I am particularly interested in the ones about app-wide state, using Firebase, and making animations in Flutter. But I'll get to those soon enough.

Here I think it may be good to pause and build out my app structure a little bit more. I am learning how to do modal overlays, so it would be good to be able to implement that for habit editing and creation.

2023.7.24
THE TAMAGOTCHI

the tamagotchi will have a value for "hunger"
this will be a value in the range of 0 to 4.

it will also have a hidden value for "time"
this will be a 3-point scale that gets incremented
through over a period of time. each point represents a
day at that value. as the time increments,
the condition of the tamagotchi changes.

4.1: content, happy. there is no roll for sickness. 5% roll for evolution
- AN ASIDE: sometimes, the tamagotchi poops. this happens
semi-randomly whenever there are incomplete habits. all the
user does to clean up the poop is complete a single habit. :)
4.2: happy, joyful. hearts emanating from tama. 10% roll for evolution
4.3: blissful. hearts emanating from tama. 20% roll for evolution

3.1: content, happy. 5% roll for sickness.
3.2: content, happy. 6% roll for sickness.
3.3: content. 7% roll for sickness.

2.1: content. 8% roll for sickness.
2.2: anxious, tired. 9% roll for sickness.
2.3: tired, upset. 10% roll for sickness.

1.1: upset. 11% roll for sickness.
2.2: upset. 12% roll for sickness.
2.3: upset, angry. 13% roll for sickness.

3.3: angry, sad. 14% roll for sickness.
3.4: sad, crying. 15% roll for sickness.
3.5: sad, crying. 16% roll for sickness.

SICKNESS:
day 1: no roll for death.
day 2: .5% roll for death.
day 3: 1% roll for death.
day 4: 5%  roll for death.
day 5+: 10% roll for death.

you cure sickness by completing habits.

2023
So I've had this idea for a self-care app.

Basically it would take all the features of Loop Habits, and add a virtual pet on top of it.

The pet gets hungry/poops on itself the more rings are X's. After a certain amount of days like this, the pet dies and gets replaced.

The pet's hunger meter fills completely only when all the habits are full. Maybe the sensitivity of this feature can be adjusted in the settings

The pet itself can appear as a phone widget, and also gives helpful notifications
## Checkr Mars Rovers

#### Code Explanation
I identified 2 entities in the exercise, the plateau and the rovers, as each of these entities has the potential to become more complex as functionalities are added to the project.

I used the `app.rb` as it was my controller, so tried to keep the logic simple and delegate complex actions to other services.

#### How To Run This Proyect
to run this proyect you need to provide an instructions file, like the one on `./instructions.txt`. 
```
$ ruby app.rb ./instructions.txt
```

#### Run Test
I used minitest for unit testing the two main classes of this proyect.
to test `plateau` class
```
$ ruby ./test/models/plateau_test.rb
```
to test `rover` class
```
$ ruby ./test/models/rover_test.rb
```
to test `follow_instructions` command
```
$ ruby test/services/controlable/follow_instructions_test.rb
```

#### assumptions
* each rover can pass over another rover in its final position
* if a rover is positioned at any time outside the plateau, it will be broken when falling

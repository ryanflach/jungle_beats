###Jungle Beats

A command-line Ruby application that allows the user to create a "beat" using strings.

The user's beat is played via the `play` method (utilizing the built-in`say` commmand).

This version of the application also allows the user to set the computer rate and voice.

####Basic Instructions:
* Load `'./lib/jungle_beat.rb'` in pry or irb (or run `ruby ./lib/jungle_beat.rb` from the terminal)
* Instantiate a new instance of the JungleBeat class and assign it to any variable.
* Using your variable name, call the method `append` and pass in any number of _string_ arguments.
* Call `play` on your instance of JungleBeat to hear your beat.
* The default rate and voice are 500 and "Boing", respectively.
  * To change the rate, set the instance of rate to any integer
  * To change the voice, set the instance of voice to any valid string voice
* To reset the rate, call `reset_rate` on your instance of JungleBeat
* To resert the voice, call `reset_voice` on your instance of JungleBeat

####Valid Voices:
Female Voices
- Agnes
- Kathy
- Princess
- Vicki
- Victoria

Male Voices
- Alex
- Bruce
- Fred
- Junior
- Ralph

Novelty Voices
- Albert
- Bad News
- Bahh
- Bells
- Boing
- Bubbles
- Cellos
- Deranged
- Good News
- Hysterical
- Pipe Organ
- Trinoids
- Whisper
- Zarvox

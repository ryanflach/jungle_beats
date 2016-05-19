require './lib/jungle_beat.rb'

class Interface
  attr_reader :new_beat

  def initialize
    @new_beat = JungleBeat.new
    puts "Welcome to Jungle Beat! We're going to make music with your \
computer!\n\n"
  end

  def status
    puts "Current voice is #{new_beat.voice} and current rate is #{new_beat.rate}"
    if new_beat.count == 0
      puts "Your beat is currently empty. Add to it!\n\n"
    else
      puts "Your current beat is #{new_beat.count} 'words' long: \
'#{new_beat.list.to_string}'\n\n"
    end
  end

  def menu
    status
    puts "Would you like to (a)dd to your beat, (p)lay your beat, (r)eset your \
beat, change the (s)peed, or change the (v)oice?"
    puts "Enter (q)uit at any time to exit"
    choice = gets.chomp.downcase
    quit_check(choice)
    menu_selection_check(choice)
  end

  def append_sounds
    puts "What 'words' would you like to add (TIP: single syllables separated \
by a space work best - and keep in mind 'q' or 'quit' will still exit!)?"
    choice = gets.chomp.to_s
    quit_check(choice)
    new_beat.append(choice)
    menu
  end

  def change_speed
    puts "How fast do you want your 'beat' played (default is 500)?"
    choice = gets.chomp.to_i
    quit_check(choice)
    speed_selection_check(choice)
    menu
  end

  def change_voice
    puts "What voice would you like your 'beat' played with? \
(default is 'Boing' -- enter (o)ptions for a list of valid choices)"
    choice = gets.chomp.to_s.downcase
    quit_check(choice)
    voice_selection_check(choice)
    menu
  end

  def speed_selection_check(input)
    if input != input.to_i || input <= 0
      puts "Please enter a positive integer. Let's try again!"
      change_speed
    else
      new_beat.rate = input
    end
  end

  def voice_selection_check(input)
    if input == 'o' || input == 'options'
      puts "The valid voices are:"
      puts valid_voices
      change_voice
    elsif !valid_voices.include?(input)
      puts "That voice isn't a valid choice. Please try again."
      change_voice
    else
      new_beat.voice = input
    end
  end

  def quit_check(input)
    if input == 'q' || input == 'quit'
      puts "See you next time!"
      exit
    end
  end

  def menu_selection_check(input)
    if input == 'a' || input == 'add'
      append_sounds
    elsif input == 'p' || input == 'play'
      puts "Check out this funky beat!"
      new_beat.play
      menu
    elsif input == 's' || input == 'speed'
      change_speed
    elsif input == 'v' || input == 'voice'
      change_voice
    elsif input == 'r' || input == 'reset'
      new_beat.count.times { new_beat.list.pop }
      menu
    else
      puts "We both want to make music, but we've gotta follow the rules!"
      puts "Please enter a valid selection - let's try it again!\n\n"
      menu
    end
  end

  def valid_voices
    ["agnes", "kathy", "princess", "vicki", "victoria", "alex", "bruce",
     "fred", "junior", "ralph", "albert", "bad news", "bahh", "bells", "boing",
     "bubbles", "cellos", "deranged", "good news", "hysterical", "pipe organ",
     "trinolds", "whisper", "zarvox"]
  end

end

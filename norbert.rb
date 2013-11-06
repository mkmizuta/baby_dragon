class Dragon
  attr_accessor :stuffInBelly, :stuffInIntestine

  def initialize(name)
    @name = name
    @asleep = false
    @stuffInBelly     = 10  #  He's full.
    @stuffInIntestine =  0  #  He doesn't need to go.

    puts ""
    puts ">> " + @name + ' is born.'
  end

  def feed
    puts ""
    puts '>> You feed ' + @name + '.'
    @stuffInBelly = 10
    passageOfTime
  end

  def walk
    puts ""
    puts '>> You walk ' + @name + '.'
    @stuffInIntestine = 0
    passageOfTime
  end

  def bed
    puts ""
    puts '>> You put ' + @name + ' to bed.'
    @asleep = true

    3.times do
      if @asleep
        passageOfTime
      end

      if @asleep
        puts ">> " + @name + ' snores, filling the room with smoke.'
      end
    end

    if @asleep
      @asleep = false
      puts ">> " + @name + ' wakes up slowly.'
    end
  end

  def toss
    puts ""
    puts '>> You toss ' + @name + ' up into the air.'
    puts '>> He giggles, which singes your eyebrows.'

    passageOfTime
  end

  def rock
    puts ""
    puts '>> You rock ' + @name + ' gently.'

    @asleep = true
    puts '>> He briefly dozes off...'

    passageOfTime

    if @asleep
      @asleep = false
      puts '>> ...but wakes when you stop.'
    end
  end

  private

  #  "private" means that the methods defined here are
  #  methods internal to the object.  (You can feed
  #  your dragon, but you can't ask him if he's hungry.)

  def hungry?
    #  Method names can end with "?".
    #  Usually, we only do this if the method
    #  returns true or false, like this:
    @stuffInBelly <= 2
  end

  def poopy?
    @stuffInIntestine >= 8
  end

  def passageOfTime
    if @stuffInBelly > 0
      #  Move food from belly to intestine.
      @stuffInBelly     = @stuffInBelly     - 1
      @stuffInIntestine = @stuffInIntestine + 1
    else  #  Our dragon is starving!
      if @asleep
        @asleep = false
        puts '>> He wakes up suddenly!'
      end
      puts ">> " + @name + ' is starving!  In desperation, he ate YOU!'
      exit  #  This quits the program.
    end

    if @stuffInIntestine >= 10
      @stuffInIntestine = 0
      puts ""
      puts '>> Whoops!  ' + @name + ' had an accident...'
    end

    if hungry?
      if @asleep
        @asleep = false
        puts '>> He wakes up suddenly!'
      end
      puts ">> " + @name + '\'s stomach grumbles...'
    end

    if poopy?
      if @asleep
        @asleep = false
        puts ""
        puts '>> He wakes up suddenly!'
      end
      puts ""
      puts ">> " + @name + ' does the potty dance...'
    end
  end

end

puts "What would you like to name your new baby dragon?"
name = gets.chomp
pet = Dragon.new(name)

puts ""
puts "What would you like to do with #{name}?"
action = gets.chomp.downcase

while true
  basic_command = ""

  [:feed, :eat, :food, :snack].each do |element|
    if action.include?(element.to_s)
      basic_command = :feed
    end
  end

  [:walk, :exercise].each do |command|
    if action.include?(command.to_s)
      basic_command = :walk
    end
  end

  [:bed, :sleep].each do |command|
    if action.include?(command.to_s)
      basic_command = :bed
    end
  end

  [:toss, :throw, :play, :bounce].each do |command|
    if action.include?(command.to_s)
      basic_command = :toss
    end
  end

  [:rock, :cradle].each do |command|
    if action.include?(command.to_s)
      basic_command = :rock
    end
  end

  if basic_command.empty?
    puts ""
    puts "Sorry, you can't do that with #{name}."
  else 
    pet.send(basic_command)
  end

  puts ""
  puts name.upcase + "'S STATS"
  puts "Hunger: " + pet.stuffInBelly.to_s
  puts "Bathroom: " + pet.stuffInIntestine.to_s
  puts ""
  puts "What would you like to do with #{name} next?"
  action = gets.chomp.downcase
end

# BUT MAKE THIS A CASE/WHEN
# if action.downcase    == "feed"
#   pet.feed
# elsif action.downcase == "walk"
#   pet.walk
# elsif action.downcase == "toss" 
#   pet.toss
# elsif action.downcase == "put to bed"
#   pet.putToBed
# elsif action.downcase     == "rock"
#   pet.rock
# else
#   puts "You can't do that with #{name}. Try something else."
#   action = gets.chomp
# end
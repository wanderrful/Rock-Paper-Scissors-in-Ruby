class Game
  $debug = true
  $order = { 'p'=>0, 's'=>1, 'r'=>2, 'q'=>3 }
  $names = { 0=>'Paper', 1=>'Scissors', 2=>'Rock'}
  @choice = nil

  def initialize
    puts "Rock, Paper, Scissors!"
    puts "Created in Ruby as a beginner level project"
    puts "by Michael Lee on 22 April, 2012"
    puts "Thank you for looking at my program!"
    sleep 3
    spacer
    beginning
  end

  #this next method is my attempt to copy old Telnet games because I don't know how to clear the console :'c
  def spacer
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
  end

  def beginning
    puts "Press ENTER when you are ready to begin."
    @choice = gets.to_s.downcase.chomp
    main
  end

  def main
   while 1
     spacer
     @choice = nil
     opp_choice = nil
     puts "Time to fight!  Choose your weapon!"
     puts "(R for rock, P for paper, S for scissors... or Q to quit)"

     # puts $order if $debug

     @choice = gets.to_s.downcase.chomp

     $order.keys.length.times { |i|
       if $order.keys[i] == @choice
         @choice = $order.values[i]
       end
     }

     opp_choice = rand(3)

     # puts $names.values[opp_choice] if $debug

     $names.keys.length.times { |i|
       if $names.keys[i] == opp_choice
         opp_choice = $names.values[i]
       end
     }

     spacer

     case @choice
       when 0
         puts "You chose Paper! Your opponent chose " << opp_choice
       when 1
         puts "You chose Scissors! Your opponent chose " << opp_choice
       when 2
         puts "You chose Rock! Your opponent chose " << opp_choice
       when 3
        ending
       else
         puts "FOUL! That was not a valid move!"
         sleep 1
         redo
     end

     sleep 1

     $names.values.length.times { |i|
       if $names.values[i] == opp_choice
         opp_choice = $names.keys[i]
       end
     }

     if (@choice == 2 and opp_choice == 0) or (@choice == 0 and opp_choice == 2)
        if @choice == 2 then
          puts "You lose! I am so sorry..."
        else
          puts "You win! Congratulations!"
        end
     else
       if @choice > opp_choice
         puts "You win! Congratulations!"
       else
         if @choice == opp_choice
           puts "A Tie!? Oh my... it appears that where is no winner!"
         else
           puts "You lose! I am so sorry..."
         end
       end
     end

     sleep 2

     spacer

     puts "Would you like to play again?"
     puts "(Press Y to play again, N to quit)"

     @choice = gets.to_s.downcase.chomp

     case @choice
       when 'y'
         puts "Okay.  Keep this party going!"
         sleep 1
         main
       when 'n'
         ending
     end

   end
  end

  def ending
    spacer
    puts "Are you sure you want to quit?"
    puts "(Y to quit, N to cancel and start over)"
    @choice = gets.to_s.downcase.chomp

    case @choice
      when 'y'
        puts "Alright.  Thanks for playing!"
        sleep 1
        exit
      when 'n'
        puts "Okay! Keep this party going!"
        sleep 1
        main
    end
  end
end

Game.new
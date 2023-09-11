require 'win32/sound'

def generate_random_number(min, max)
  rand(min..max)
end

def play_game
  min_number = 1
  max_number = 100
  secret_number = generate_random_number(min_number, max_number)
  attempts = 0

  puts "Welcome to the Number Guessing Game!"
  Win32::Sound.play("SystemStart", Win32::Sound::ALIAS)
  sleep(1.5)
  puts "I have selected a number between #{min_number} and #{max_number}. Try to guess it!"
  sleep(1.5)

  loop do
    print "Enter your guess: "
    guess = gets.chomp.to_i
    attempts += 1

    if guess < secret_number
      puts "Too low! Try a higher number."
      Win32::Sound.play("SystemHand", Win32::Sound::ALIAS)
    elsif guess > secret_number
      puts "Too high! Try a lower number."
      Win32::Sound.play("SystemHand", Win32::Sound::ALIAS)
    else
      puts "Congratulations! You guessed the number #{secret_number} in #{attempts} attempts."
      Win32::Sound.play("SystemExit", Win32::Sound::ALIAS)
      break
    end
  end
end

play_game
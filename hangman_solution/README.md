# Overview

To solidify the concepts we’ve covered in class you are to team up with 1-2 other students in the class and build a simple command line game in ruby. You will be given time during class on Tuesday, Wednesday and Thursday to work on your game.

Furthermore your game **should be built using the Test Driven Development (TDD) methodology** we discussed in class on Monday.

## Objectives

* Further solidify Ruby concepts in preparation for Rails
* Use existing Ruby knowledge to learn new Ruby methods
* Practice collaborative programming
* Practice time estimation
* Practice TDD

# Hangman

Hangman is a guessing game with words. One player ("the game master") chooses a word and another player ("the player") tries to discover word by guessing one letter at a time. The player has 8 `chances` to guess all the letters in the game.

## Starting the Game
In our version of Hangman the game master (see above) is the computer.

The game starts off with the computer choosing a word and displaying that word with ever letter replaced by a `_` character. For example, if the word is *lemonade* the computer displays `_ _ _ _ _ _ _ _`. To make the computer choose a random word, we recommend that you build an array of preset words and choose a random word out of that array.

We also want to show the player the number of chances they have to guess the word. Since we're just starting the game, that number is 8.

```

              _ _ _ _ _ _ _ _


Guessed: 


Chances: 8

  Enter guess: 
```

## Guessing Logic

Each turn the player guesses a letter.

If the player guessed right, all occurences of the letter are revealed. For example, if the hidden word is *lemonade* and the player's first guess is `e`, the word becomes `_ e _ _ _ _ _ e`. The number of `chances` does not change 

If the player guessed wrong:

 * the number of `chances` is reduced by 1
 * the letter is added to the list of `guessed letters`, which is displayed every turn


Here's a sample output for round 5 of the game where the word is *lemonade* and the player already guessed letters `e`, `t`, `m` and `z`

```

              _ e m _ _ _ _ e


Guessed: t, z


Chances: 6

  Enter guess: 
```

## Game Ending

The game has two possible outcomes.

### Player Wins

The game ends if the player successfully guessed all letters in the game with `chances` to spare. The program should print out a message saying the player won.

### Player Loses

The game ends as soon as the player used up their last `chance`. The program should print out a message saying the player lost.

## Tips

* Don't start coding right away. Use pen and paper to figure out how you're going to break down the problem. 
* Break out your solution into different methods and write unit tests for each of those methods. For example, you might have a method called `get_random_word` that is responsible for choosing a random word out of your array of words.


### Helpful Resources

[Stack Overflow: Read input from console in Ruby](http://stackoverflow.com/questions/6556280/read-input-from-console-in-ruby)

[Ruby-Docs: print method](http://ruby-doc.org/core-2.0/Kernel.html#method-i-print)

[WikiBooks: Ruby Programming/Unit testing](http://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing)

[Ruby-Doc: Arrays](http://ruby-doc.org/core-1.9.3/Array.html)

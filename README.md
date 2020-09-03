1. Add indicator or color change when you get more stamina. Maybe your orb color should get stronger or a large burst of light as you absorb a particle. 
2. Perhaps add some glowing fixed particles inside the orb so that it is easier to see it move. Though this may violate your flat ascetic. 
3. Add some subtle sounds when stamina goes up or down. These sounds should be louder or faster when you are on a purple or white texture. 
4. Remove the “Stamina” meter and replace it with an internal glow that gets brighter or weaker depending on how much stamina you have. 
5. For some reason I expected to get directional momentum out of pressing the space bar not just vertical momentum. I think because it is a ball. 
6. When you hit a corner you first hit the corner and then the perspective changes so you lose all your momentum. This prevents you from pulling off cool maneuvers ignoring the perspective. Being able to pull off corner looping maneuvers feels like it should be the players reward for training their perspective. 
7. When I fall from a great height you should have an encouraging message. 
8. Messages should clear after a few seconds to allow you to be more immersed in the game.  
9. 


# Supreme TicTacToe

## Overview 

You a mere mortal meatbag, face off against the perfect immortal machine known as "Supreme" in an epic battle of X's and O's. It will require all or your human cunning to find and exploit bugs to defeat Supreme at it's own game. 

## Less Hyperbolic Overview 

Supreme TicTacToe was created when I was playing around with implementing miniMax alpha beta pruning in Lua for Love2d. I got tired of playing against myself and so added a little frenemy to play against. 

Overall it is a puzzle game. You cannot defeat Supreme at tictactoe but if you’re clever you unleash your inner QA engineer and exploit bugs in Supreme's code. 

## Code Overview

As with all Love2d programs the entry point is 'main.lua'. All traditional love game loop calls are routed to the 'SceneManager' which is a singleton responsible for directing calls to the active scene. 

# File Structure

assets - Contains graphics, sounds, fonts, ect.
entities - If it draws on the screen it is an entity. Entities are created using entity1 = Entity:new() 
lib - Libraries contain global functions that are expected to exist only once. There internal function are called using lib.function()
quips - Quips control Supreme's speech. There are autoload by the quipManager library and new quips can be added directly  
scenes - Scenes are the game-loop for each scene. They are auto-loaded by the sceneManager. 
config.lua - Basic config data mostly used for debugging. 
main.lua - Program start point.

# Running The Game. 

Supreme TicTacToe can be run directly from the console using the below command on mac/linux systems.

``
love . --console
``

# Building the game

We build Supreme TicTacToe using 'Make Love' available here. 

https://github.com/pfirsich/makelove



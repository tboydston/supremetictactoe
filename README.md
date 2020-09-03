# Supreme TicTacToe

## Overview 

You a mere mortal meatbag, face off against the perfect immortal machine known as "Supreme" in an epic battle of X's and O's. It will require all or your human cunning to find and exploit bugs to defeat Supreme at it's own game. 

## Less Hyperbolic Overview 

Supreme TicTacToe was created when I was playing around with implementing miniMax alpha beta pruning in Lua for Love2d. I got tired of playing against myself and so added a little frenemy to play against. 

Overall it is a puzzle game. You cannot defeat Supreme at tictactoe but if you’re clever you unleash your inner QA engineer and exploit bugs in Supreme's code. 

## Code Overview

As with all Love2d programs the entry point is 'main.lua'. All traditional love game loop calls are routed to the 'SceneManager' which is a singleton responsible for directing calls to the active scene. 

# File Structure

assets - Contains graphics, sounds, fonts, ect.<br>
entities - If it draws on the screen it is an entity. Entities are created using entity1 = Entity:new() <br>
lib - Libraries contain global functions that are expected to exist only once. There internal function are called using lib.function()<br>
quips - Quips control Supreme's speech. There are autoload by the quipManager library and new quips can be added directly  <br>
scenes - Scenes are the game-loop for each scene. They are auto-loaded by the sceneManager. <br>
config.lua - Basic config data mostly used for debugging.<br>
main.lua - Program start point.<br>

# Running The Game. 

Supreme TicTacToe can be run directly from the console using the below command on mac/linux systems.

``
love . --console
``

# Building the game

We build Supreme TicTacToe using 'Make Love' available here. 

https://github.com/pfirsich/makelove

# Thanks
Thanks to Komodeo for playtesting and improving content.



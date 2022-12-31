# Tennis (paper game)  
Tennis is an (abstract) strategic pencil and paper game for two players. The game field consists of 4 fields and a centre line. These are called (-2,-1,0,1,2), with negative numbers belonging to player 1, positive to player 2. At start, the ball is at the centre line (0).

Both players start with the same initial number (e.g. 50 points). In each draw, both players choose a number, and the ball is moved towards the player with the smallest number. The number chosen reduces the points for the next draws. The aim of the game is to move the ball beyond the second field of the opponent.


## How to play the game?
To play the game, you should run in the terminal the following command: ``./tennis_paper.sh`` and then each player plays in his turn.
(Each player input is masking in the program by the flag ``-s`` so that neither player can know what the other has played.)

Here are some examples of a game by 2 players:  
![image](https://user-images.githubusercontent.com/71727260/209853916-dec401f9-54d1-4626-927c-d181cad3e6b1.png) <img src="https://user-images.githubusercontent.com/71727260/209854158-8a680c9d-dab1-48cc-83c8-592ea4f5f678.png" width="207">


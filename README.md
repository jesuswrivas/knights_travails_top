# knights_travails_top
Knights travails project, for The Odin Project Ruby Course

The task is to build a function called knight_moves that shows the shortest possible way to get from one square to another by outputting all squares the knight will stop on along the way. 

I made the mistake of coding without a 100% proper plan and ended up deleting and trying many options, toying around with several graphs. 
In the end, I just used BFS on the graph of neighboring squares (valid moves for the initial square and their neighbors, and so on).

I tried to complete the task while laying the foundations for my final project in TOP, which is a chess game. 
I couldn't find a way to generate the neighboring squares and call the short_path function without making things too difficult. So there are some methods that are for something else 
As this method will not be necessary (I think), everything was written in the game_board class.

TLDR: The code is a little messy, but I finished the task using BFS

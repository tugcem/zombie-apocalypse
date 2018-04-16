# Zombie Apocalypse v4.3

======== 2017 June ==========

Instruction

● Please read the problem description thoroughly then create a program to solve the problem.
● For the solution, we prefer you to use Java, Ruby, C# or Javascript.
● There is no requirement for visualising this in any way beyond the console output
specified below.
● Please include instructions on how to run your application in a README file in the
root directory.
● Your application must run, and generate the correct result.
● To submit your code: either compress your files into a single Zip or GZip archive and
send via email, or store your code in private repositories and give us the access right.
Please DO NOT publish the code in public repositories.
● As a general rule, we allow  3 days  from the date that you receive these instructions
to submit your code, but you may request more time if needed.

This exercise could take you anywhere around 2 to 8 hours to complete depends on your approach, experience and how much time you have to spare.

Through this exercise we assess a number of things including the design of your solution and your programming skills. We will review the code and may offer you an interview in which we will discuss the design and code decisions you made.

While these are small problems, we expect you to submit what you believe is  production quality code . That is code that you would be happy to test, run, maintain, and evolve.

Problem Description

After the nuclear war, a strange and deadly virus has infected the planet. Living creatures are becoming zombies that spread their zombiness by an unfriendly bite. The world consists of an  n  x  n  grid on which  zombies   and  creatures  live.

Both of these occupy a single square on the grid and can be addressed using zero-indexed x-y coordinates. Top left corner is  (x: 0, y: 0)  with x represent horizontal coordinate, y represent vertical coordinate. Any number of zombies and creatures may occupy the same grid square.

At the beginning of the program a single zombie awakes and begins to move around the grid. It is given an initial x-y coordinate and a list of movements, up, down, left and right ( U , D , L , R ).

The ordered sequence of movements is represented as a string, for example:  DLUURR (down, left, up, up, right, right). Zombies can move through the edge of the grid, appearing on the directly opposite side. For a 10x10 grid, a zombie moving left for (0,4) will move to (9,4); a zombie moving down from (3,9) will move to (3,0).

The poor creatures in the area are the zombie’s victims. The also have an initial x-y coordinate. The creatures are aware of zombie presence, but are so frightened that they never move.

If a zombie moves so that it end up on the same location as a creature, the creature is transformed into another zombie and zombies score one  point . The zombie continues moving and infecting creatures until has performed all its moves.

Once it has completed its movement, the first newly created zombie moves using the same sequence as the original zombie. Once it has completed its move, the second newly created zombie moves, and so in order of infection with each zombie performing the same sequence of moves. Once no new zombies have been created and all the zombies have completed moving the program ends.

Your task is to program to take an input txt file about the zombie game and output the result:

Given a file that contains:
● dimensions of the area (N)
● initial position of the zombie
● a list of positions of poor creatures
● and a list of moves zombies will make

Example input:
4
(2,1) (0,1)(1,2)(3,1)
DLUURR

The program should output (print to console, or to text, or display in UI etc.)
● the number of points scored by the zombies
● the final position of the zombies

Example output:
zombies score: 3
zombies positions: (3,0)(2,1)(1,0)(0,0)

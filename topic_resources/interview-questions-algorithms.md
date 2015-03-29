# Interview Questions - Algorithms

+ Prison Guard
  - You're the guard of a prison, you want to keep an eye on the most dangerous prisoner. Each prisoner has a danger rank of his own and a group of friends (prisoners, who also have danger ranks). The guard has a list of prisoners with their corresponding danger ranks and he also has a list of the friends of each of the prisoners in the prison.
  - The danger rank is computed as follows: Prisoner 1 has a danger value of 5, his friends are Prisoner 2 and Prisoner 5, who have danger values of 3 and 4 respectively. So the danger value of Prisoner 1 is 5+3+4 = 12.
  - There could be any number of prisoners. Whichever prisoner has the highest value is the most dangerous(computed using the above method).
  - Friendship can be assumed to be symmetric.
  - Come up with an efficient algorithm to find the most dangerous prisoner?
+ Tape Backup System
  - You need to implement a new backup system, in which files are stored into data tapes. This new system must follow the following 2 rules:
    1. Never place more than two files on the same tape.
    2. Files cannot be split across multiple tapes.
  - It's guaranteed that all tapes have the same size and that they will always be able to store the largest file.
  - Every time this process is executed, we already know the size of each file, and the capacity of the tapes. Having that in mind, we want to design a system that is able to count how many tapes will be required to store the backup in the most efficient way.
  - The parameter of your function will be a structure that will contain the file sizes and the capacity of the tapes. You must return the minimum amount of tapes required to store the files.
  - Example: Input: Tape Size = 100; Files: 70, 10, 20  Output: 2
+ Tree Processing
  - Given a binary tree and a positive integer, return the k-th element of the tree
  - No preprocessing or modification of the tree allowed
+ Find the celebrity
  - Given a set of n people, find the celebrity
  - Celebrity knows himself and no one else
  - Everyone knows the celebrity
  - You are given the following helper: know(x,y) returns true if x knows y, false otherwise
  - O(n)?
+ Poker Hand
  - Given a hand of 5 cards, determine the best hand that can be made from those cards (Royal Flush... High Card)
+

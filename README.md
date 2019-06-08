# number-pair-challenge

## How To Run
### Ruby Version

1. Clone repository
2. Open terminal and set current directory to number-pair-challenge/ruby/
3. Run in the terminal "bundle install" to install all the Ruby dependencies
4. Navigate to number-pair-challenge/ruby/lib
5. In the console, type "ruby app.rb". This will run the program. The example from the problem is the default input. The three different cases will print to the terminal.

If you want to input your own code, please set "input" in app.rb to be what you want to run. Then just run "ruby app.rb" again to process the new code.

The input should be an array of integers to get an interesting result. If the app is given a non array or an array with less than 2 items, an empty array is returned.

## The problem
Please complete the following using the programming language of your choice (I'd prefer Java) and return your work to me within 24 hours.  Please be considerate of the running time of your algorithm to solve the problem.

Write a program that allows for an integer array to be passed in and will then output all of the pairs that sum up to 10.  Please provide a solution that allows for 1) output all pairs (includes duplicates and the reversed ordered pairs), 2) output unique pairs only once (removes the duplicates but includes the reversed ordered pairs), and 3) output the same combo pair only once (removes the reversed ordered pairs).

For example passing in [1, 1, 2, 4, 4, 5, 5, 5, 6, 7, 9] the following results should occur:

  1) output all pairs would output: [1,9], [1,9], [4,6], [4,6], [5,5], [5,5], [5,5], [5,5], [5,5], [5,5], [6,4], [6,4] [9,1] , [9,1]

  2) output unique pairs only once would output: [1,9], [4,6], [5,5], [6,4], [9,1]

  3) output the same combo pair only once would output: [1,9], [4,6], [5,5]   

## Assumptions
1. that the input could be positive or negative.
2. Any length of input
3. Input can be anything and any kind of data can be in the array. We only want to handle integers, though.


## Reasoning
1. Check if the input is actually an array. If not, return []
2. The input array needs to be sanitized to make sure only integers are being passed into the method.
3. The input list/array would not necessarily be sorted, so the newly sanitized array is sorted in ascending order.
4. It was made clear in the problem that run time is important and the input can be any size.
5. Sorting takes time and the Ruby Array#sort averages O(n log n) and its worst-case is O(n^2)
6. Iterating through the entire array to check every other element of the array if there is computationally intense
7. Having the sorted array allows the search to eliminate terms it has to search as the search goes on.

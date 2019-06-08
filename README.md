# number-pair-challenge

##The problem
Write a program that allows for an integer array to be passed in and will then output all of the pairs that sum up to 10.  Please provide a solution that allows for 1) output all pairs (includes duplicates and the reversed ordered pairs), 2) output unique pairs only once (removes the duplicates but includes the reversed ordered pairs), and 3) output the same combo pair only once (removes the reversed ordered pairs).


For example passing in [1, 1, 2, 4, 4, 5, 5, 5, 6, 7, 9] the following results should occur:

  1) output all pairs would output: [1,9], [1,9], [4,6], [4,6], [5,5], [5,5], [5,5], [5,5], [5,5], [5,5], [6,4], [6,4] [9,1] , [9,1]

  2) output unique pairs only once would output: [1,9], [4,6], [5,5], [6,4], [9,1]

  3) output the same combo pair only once would output: [1,9], [4,6], [5,5]   

##Assumptions
1. that the input could be positive or negative.
2. Any length of input
3. Input can be anything and any kind of data can be in the array. We only want to handle integers, though.


##Methodology
1. Check if the input is actually an array. If not, return []
2. The input array needs to be sanitized to make sure only integers are being passed into the method.
3. The input list/array would not necessarily be sorted, so the newly sanitized array is sorted in ascending order.

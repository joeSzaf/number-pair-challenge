package com.joeszaf;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {

    public static void main(String[] args) {
        int sampleArray[] = { 1, 1, 2, 4, 4, 5, 5, 5, 6, 7, 9 };
        int sum = 10;

        java.util.List<int[]> case1Array = case1(sampleArray, sum);

        System.out.println("Case 1:");

        for (int z = 0; z < case1Array.size(); z++) {
            int[] pair = case1Array.get(z);
            System.out.println("(" + pair[0] + ", " + pair[1] + ")");
        }

        System.out.println();

        java.util.List<int[]> case2Array = case2(sampleArray, sum);

        System.out.println("Case 2:");

        for (int z = 0; z < case2Array.size(); z++) {
            int[] pair = case2Array.get(z);
            System.out.println("(" + pair[0] + ", " + pair[1] + ")");
        }

        System.out.println();

        java.util.List<int[]> case3Array = case3(sampleArray, sum);

        System.out.println("Case 3:");

        for (int z = 0; z < case3Array.size(); z++) {
            int[] pair = case3Array.get(z);
            System.out.println("(" + pair[0] + ", " + pair[1] + ")");
        }


    }

    public static java.util.List<int[]> findPairs(int[]arr, int sum) {
        if (arr.length < 2) {
            return new ArrayList<int[]>();
        }

        Arrays.sort(arr);

        List<int[]> pairs = new ArrayList<int[]>();

        int high_index = arr.length - 1;

        int i = 0;
        int j = high_index;

        while (arr[i] <= sum/2 && i < arr.length - 1) {
            j = high_index;

            while (arr[i] + arr[j] >= sum && i < j) {
                if (arr[i] + arr[j] > sum) {
                    high_index --;
                } else if (arr[i] + arr[j] == sum) {
                    int[] pair = { arr[i], arr[j] };
                    pairs.add(pair);
                }

                j--;
            }

            i++;
        }

        return pairs;
    }

    public static java.util.List<int[]> case1(int[]arr, int sum) {

        List<int[]> pairs = findPairs(arr, sum);

        if (pairs.size() < 2) {
            return new ArrayList<int[]>();
        }

        for (int k = pairs.size() -1; k >= 0; k--) {
            int[] pair = pairs.get(k);
            int[] newPair = { pair[1], pair[0] };
            pairs.add(newPair);
        }

        return(pairs);
    }

    public static java.util.List<int[]> case2(int[]arr, int sum) {
        java.util.List<int[]> pairs = case3(arr, sum);

        if (pairs.size() < 2) {
            return new ArrayList<int[]>();
        }

        for (int k = pairs.size() -2; k >= 0; k--) {
            int[] pair = pairs.get(k);
            int[] newPair = { pair[1], pair[0] };
            pairs.add(newPair);
        }

        return(pairs);
    }

    public static java.util.List<int[]> case3(int[]arr, int sum) {
        java.util.List<int[]> pairs = findPairs(arr, sum);

        if (pairs.size() < 2) {
            return new ArrayList<int[]>();
        }

        List<int[]> uniquePairs = new ArrayList<>();

        int[] pair = pairs.get(0);
        int[] firstPair = { pair[0], pair[1] };

        uniquePairs.add(firstPair);

        int i = 0;

        while (i < pairs.size()) {
            int[] currentPair = pairs.get(i);
            int[] currentUniquePair = uniquePairs.get(uniquePairs.size()-1);

            if (currentPair[0] != currentUniquePair[0] && currentPair[1] != currentUniquePair[1]) {
                uniquePairs.add(currentPair);
            }

            i ++;
        }

        return uniquePairs;
    }



}

import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Buffer "mo:base/Buffer";
import Option "mo:base/Option";
import Iter "mo:base/Iter";
import P "mo:base/Prelude";

actor {

  // challenge 1: function takes two natural numbers n and m and returns the sum
  public func add(n: Nat,m: Nat ): async Nat {
    return (m+n);
  };


// Challenge 2 : Write a function square that takes a natural number n and returns the area of a square of length n
  public func square(n: Nat): async Nat {
    return (n*n);
  };


// Challenge 3 : Write a function days_to_second that takes a number of days n and returns the number of seconds
  public func days_to_second(n: Nat): async Nat {
    return (n*86400);
  };


/* Challenge 4 : Write two functions increment_counter & clear_counter .
increment_counter returns the incremented value of counter by n.
clear_counter sets the value of counter to 0. */
  var counter : Nat = 0;

  public func increment_counter(n: Nat): async (){
    counter := counter + n;
  };

  public func clear_counter(): async (){
    counter := 0;
  };

  public func read_counter() : async Nat {
    counter
  };



// Challenge 5 : Write a function divide that takes two natural numbers n and m and returns a boolean indicating if y divides x.
  public func divide(n: Nat,m: Nat ): async Bool {
    if (m == 0 or (n % m) != 0) {
      return false;
    };
    return true;
  };


// Challenge 6 : Write a function is_even that takes a natural number n and returns a boolean indicating if n is even.
  public func is_even(n: Nat): async Bool {
    if ((n % 2) == 0) {
      return true;
    };
    return false;
  };


// Challenge 7 : Write a function sum_of_array that takes an array of natural numbers and returns the sum. This function will returns 0 if the array is empty.
  public func sum_of_array(arr: [Nat] ): async Nat {
    var sum : Nat = 0;
    for (value in arr.vals()){
            sum := sum + value;
        };
    return sum;
  };


// Challenge 8 : Write a function maximum that takes an array of natural numbers and returns the maximum value in the array. This function will returns 0 if the array is empty.
  public func maximum(arr: [Nat] ): async Nat {
    var max : Nat = 0;
    for (value in arr.vals()){
            if (value > max){
              max := value
            }
        };
    return max;
  };


// Challenge 9 : Write a function remove_from_array that takes 2 parameters : an array of natural numbers and a natural number n and returns a new array where all occurences of n have been removed (order should remain unchanged).
  public func remove_from_array(arr: [Nat],n: Nat ): async [Nat] {
    var new_arr : [Nat] = [];
    for (value in arr.vals()){
            if (value != n){
              new_arr := Array.append<Nat>(new_arr, [value]);
              //Buffer.append<Nat>(new_arr, [value]);
              //Buffer.add<Nat>(value)
             //new_arr := Buffer.add<Nat>(new_arr, value);
            };
        };
    return new_arr;
  };



/* Challenge 10 :
Watch this video on selection sort.
Implement a function selection_sort that takes an array of natural numbers and returns the sorted array */
  public func selection_sort(arr: [Nat] ): async [Nat] {
    //Transform an immutable array into a mutable array.
    var sortArr : [var Nat] = Array.thaw(arr);
    let size = sortArr.size();
    var min_index : Nat = 0;
    var i : Nat = 0 ;
    for (i in Iter.range(1,size)){
      min_index := i;
      for (j in Iter.range((i + 1), size - 1 ))
      {
        if (arr[min_index] > sortArr[j]) {
          var temp : Nat = sortArr[min_index];
          sortArr[min_index] := sortArr[j];
          sortArr[j] := temp;
        };
      };
    };
    //Transform mutable array into immutable array
    return Array.freeze(sortArr);
  };

};

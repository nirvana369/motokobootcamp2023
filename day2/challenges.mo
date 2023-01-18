import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import Hash "mo:base/Hash";
import Array "mo:base/Array";
import Stack "mo:base/Stack";
import Option "mo:base/Option";
import Char "mo:base/Char";

actor {

  //1.Write a function average_array that takes an array of integers and returns the average value of the elements in the array.
  public query func average_array(array : [Int]) : async Int {
    var avg : Int = 0;
    for (n in array.vals()) {
      avg += n;
    };
    return (avg / array.size());
  };

  // 2.Character count: Write a function that takes in a string and a character, and returns the number of occurrences of that character in the string.
  public func count_character(t : Text, c : Char) : async Nat {
    var count : Nat = 0;
    for (x in t.chars()) {
      if (c == x) {
        count += 1;
      };
    };
    return count;
  };

  // 3.Write a function factorial that takes a natural number n and returns the factorial of n.
  public func factorial(n : Nat) : async Nat {
    var i : Nat = 2;
    var c : Nat = 1;
    while (i != n + 1) {
      c *= i;
      i += 1;
    };
    return c;
  };

  // 4.Write a function number_of_words that takes a sentence and returns the number of words in the sentence.
  public func number_of_words(t : Text) : async Nat {
    var num_word = 0;
    var count_word = 0;
    for (c in t.chars()) {
      if (Char.compare(c, ' ') == #equal or Char.compare(c, ' ') == #equal) {
        count_word := 0;
      } else {
        count_word += 1;
        if (count_word == 1) {
          num_word += 1;
        };
      };
    };
    return num_word;
  };

  // 5.Write a function find_duplicates that takes an array of natural numbers and returns a new array containing all duplicate numbers. The order of the elements in the returned array should be the same as the order of the first occurrence in the input array.
  public func find_dupplicates(a : [Nat]) : async [Nat] {
    var ret : [Nat] = [];
    let h : HashMap.HashMap<Nat, Nat> = HashMap.HashMap<Nat, Nat>(1, Nat.equal, Hash.hash);
    for (num in a.vals()) {
      switch (h.get(num)) {
        case (?n) h.put(num, 2);
        case null h.put(num, 1);
      };
    };
    for (num in a.vals()) {
      if (h.get(num) == ?2) {
        ret := Array.append<Nat>(ret, [num]);
        h.put(num, 0);
      };
    };
    return ret;
  };

  // 6.Write a function convert_to_binary that takes a natural number n and returns a string representing the binary representation of n.
  public func convert_to_binary(n : Nat) : async Text {
    var ret = "";
    var num = n;
    let stack : Stack.Stack<Text> = Stack.Stack<Text>(); 
    while (num != 0) {
      stack.push(Nat.toText(num % 2));
      num /= 2;
    };
    while (stack.isEmpty() == false) {
      ret := ret # Option.get(stack.pop(), "");
    };
    return ret;
  };
};

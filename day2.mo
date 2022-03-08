import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Buffer "mo:base/Buffer";
import Char "mo:base/Char";
import Iter "mo:base/Iter";
import Nat8 "mo:base/Nat8";
import Blob "mo:base/Blob";
import Nat32 "mo:base/Nat32";
import Error "mo:base/Error";
import Prim "mo:prim";

actor {

  let arrEx = Array.init<Nat>(100,1);
// Challenge 1 : Write a function nat_to_nat8 that converts a Nat n to a Nat8. Make sure that your function never trap.
  public func nat_to_nat8(n: Nat): async Nat8 {
    if (n > 255){
      throw Error.reject("out of range for type Nat8");
    };
    return Nat8.fromNat(n);
  };


// Challenge 2 : Write a function max_number_with_n_bits that takes a Nat n and returns the maximum number than can be represented with only n-bits.
  public func max_number_with_n_bits(n: Nat ): async Nat {
    var max_number :Nat = 0;
    for (i in Iter.range(0,n-1)){
      max_number := max_number +  Nat.pow(2,i);
    };
    return max_number;
  };


/* Challenge 3 : Write a function decimal_to_bits that takes a Nat n and returns a Text corresponding to the binary representation of this number.
Note : decimal_to_bits(255) -> "11111111". */
  public func decimal_to_bits(n: Nat): async Text {
    var result :Text = "";
    var a :Nat = n;
    var x :Nat = 0;
    while (a > 0){
      x := a%2;
      result := Text.concat(Nat.toText(x),result) ;
      a :=(a-x)/2;
    };
    return result;
  };



// Challenge 4 : Write a function capitalize_character that takes a Char c and returns the capitalized version of it.
  public func capitalize_character(c: Char): async Char {
    if (Char.isUppercase(c)){
      return c;
    };
    var natC : Nat = Nat32.toNat(Char.toNat32(c));
    if (natC >= 97 and natC <= 122){
      var natU32 : Nat32 = Nat32.fromNat(natC - 32);
      return Char.fromNat32(natU32);
    }
    else{
      throw Error.reject("non-alphabetic characters");
    }
  };

// Challenge 5 : Write a function capitalize_text that takes a Text t and returns the capitalized version of it.
  public func capitalize_text(t: Text): async Text {
    return Text.map(t , Prim.charToUpper);
    // var capitalized :Text = "";
    // for(char in t.chars()){
    //   capitalized := capitalized # Char.toText(char);
    // };
    // return capitalized;
  };


// Challenge 6 : Write a function is_inside that takes two arguments : a Text t and a Char c and returns a Bool indicating if c is inside t .
  public func is_inside(t: Text,c: Char ): async Bool {
    for(char in t.chars()){
      if (char == c){
        return true;
      }
    };
    return false;
  };


/* Challenge 7 : Write a function trim_whitespace that takes a text t and returns the trimmed version of t.
 Note : Trim means removing any leading and trailing spaces from the text : trim_whitespace(" Hello ") -> "Hello". */
  public func trim_whitespace(t: Text): async Text {
    return Text.trim(t, #text " ");
  };


/* Challenge 8 : Write a function duplicated_character that takes a Text t and returns the first duplicated character in t converted to Text.
 Note : The function should return the whole Text if there is no duplicate character : duplicated_character("Hello") -> "l" & duplicated_character("World") -> "World". */
  public func duplicated_character(t: Text): async Text {
    var chars : [Char]= Iter.toArray(t.chars());
     for(i in Iter.range(0,t.size() - 2)){
      if (chars[i] == chars[i+1]){
        return Text.fromChar(chars[i]);
        };
     };
    return t;
  };


// Challenge 9 : Write a function size_in_bytes that takes Text t and returns the number of bytes this text takes when encoded as UTF-8.
  public func size_in_bytes(t: Text): async Nat {
    //var BlobT = Text.encodeUtf8(t);
    return (Blob.toArray(Text.encodeUtf8(t)).size());
  };


/* Challenge 10 :
Watch this video on bubble sort.
Implement a function bubble_sort that takes an array of natural numbers and returns the sorted array .*/
  public func bubble_sort(arr: [Nat] ): async [Nat] {
    //Transform an immutable array into a mutable array.
    var sortArr : [var Nat] = Array.thaw(arr);
    let size = sortArr.size();
    for (i in Iter.range(0,size - 1)){
      for (j in Iter.range(1, size - i - 1))
      {
        if (sortArr[j-1] > sortArr[j]) {
          var temp : Nat = sortArr[j-1];
          sortArr[j-1] := sortArr[j];
          sortArr[j] := temp;
        };
      };
      };
    //Transform mutable array into immutable array
    return Array.freeze(sortArr);
    };

}
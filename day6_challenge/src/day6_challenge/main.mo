import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Result "mo:base/Result";
import Nat "mo:base/Nat";
import Error "mo:base/Error";
import Hash "mo:base/Hash";
import HTTP "http";
import Text "mo:base/Text";
import Option "mo:base/Option";
import Array "mo:base/Array";

actor {

/* Challenge 1 : Create an actor in main.mo and declare the following types.

TokenIndex of type Nat.
Error which is a variant type with multiples tags :
 */

type TokenIndex = Nat;
type Error = {
        #system;
        #logic;
    };

/* Challenge 2 : Declare an HashMap called registry with Key of type TokenIndex and value of type Principal. This will keeep track of which principal owns which TokenIndex. */
var registry = HashMap.HashMap<TokenIndex, Principal>(0, Nat.equal, Hash.hash);


/* Challenge 3 : Declare a variable of type Nat called nextTokenIndex, initialized at 0 that will keep track of the number of minted NFTs.
Write a function called mint that takes no argument.
This function should :

Returns a result of type Result and indicate an error in case the caller is anonymous.
If the user is authenticated : associate the current TokenIndex with the caller (use the HashMap we've created) and increase nextTokenIndex. */
stable var nextTokenIndex : Nat = 0;

type Result<Bool , Text> = {#ok: Bool; #announ : Text};
public shared ({caller}) func mint() : async Result<Bool, Text> {
  if(Principal.isAnonymous(caller)){
    return #announ("Show yourself");
  } 
  else{
    registry.put(nextTokenIndex, caller); 
    nextTokenIndex += 1;
    return #ok(true);
    }
  };
/*  */

/*  */

};

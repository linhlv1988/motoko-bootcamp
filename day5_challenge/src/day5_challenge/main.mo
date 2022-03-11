import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Buffer "mo:base/Buffer";
import Char "mo:base/Char";
actor {

/*Challenge 1 : Write a function is_anonymous that takes no arguments but returns true is the caller is anonymous and false otherwise. */
   public shared({caller}) func is_anonymous() : async Bool {
        return Principal.isAnonymous(caller);
    };


       /* Challenge 2 : Create an HashMap called favoriteNumber where the keys are Principal and the value are Nat. */
  let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);
  

  /* Challenge 3 : Write two functions :
add_favorite_number that takes n of type Nat and stores this value in the HashMap where the key is the principal of the caller. This function has no return value.
show_favorite_number that takes no argument and returns n of type ?Nat, n is the favorite number of the person as defined in the previous function or null if the person hasn't registered.*/
   public shared({caller}) func add_favorite_number(n :Nat):  {
        favoriteNumber.put(caller, n);
    };  
  
  public shared({caller}) func show_favorite_number () : async ?Nat {
        return favoriteNumber.get(caller);
    };





}

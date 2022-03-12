import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Buffer "mo:base/Buffer";
import Char "mo:base/Char";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Cycles "mo:base/ExperimentalCycles";

actor {

    stable var entries : [(Principal, Nat)] = [];

    system func preupgrade() {
        entries := Iter.toArray(favoriteNumber.entries());
    };

    system func postupgrade() {
        entries := [];
    };

   
       /* Challenge 2 : Create an HashMap called favoriteNumber where the keys are Principal and the value are Nat. */
  let favoriteNumber = HashMap.HashMap<Principal, Nat>(0, Principal.equal, Principal.hash);
  

  /* Challenge 3 : Write two functions :
add_favorite_number that takes n of type Nat and stores this value in the HashMap where the key is the principal of the caller. This function has no return value.
show_favorite_number that takes no argument and returns n of type ?Nat, n is the favorite number of the person as defined in the previous function or null if the person hasn't registered.*/
  //  public shared({caller}) func add_favorite_number(n :Nat):  {
  //       favoriteNumber.put(caller, n);
  //   };  
  
  public shared({caller}) func show_favorite_number () : async ?Nat {
        return favoriteNumber.get(caller);
    };

/* Challenge 4 : Rewrite your function add_favorite_number so that if the caller has already registered his favorite number, 
the value in memory isn't modified. 
This function will return a text of type Text that indicates "You've already registered your number" 
in that case and "You've successfully registered your number" in the other scenario.*/
   public shared({caller}) func add_favorite_number(n :Nat): async Text {
        if(favoriteNumber.get(caller) != null)
            return "You have already registered your number";
        favoriteNumber.put(caller, n);
        return "You have successfully registered your number";
    };  

/* Challenge 5 : Write two functions

update_favorite_number
delete_favorite_number
 */
  public shared({caller}) func update_favorite_number(n :Nat) : async Text {
        favoriteNumber.put(caller, n);
        
        return "You have successfully updated your number";
    };
  public shared({caller}) func delete_favorite_number () : async Text {
      if(favoriteNumber.get(caller) == null)
          return "You do not have any number";
      favoriteNumber.delete(caller);
      return "You have successfully deleted your number";
  };

    
};

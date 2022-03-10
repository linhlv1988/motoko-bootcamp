import Array "mo:base/Array";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Iter "mo:base/Iter";
import Nat8 "mo:base/Nat8";
import Error "mo:base/Error";
import Prim "mo:prim";
import Option "mo:base/Option";
import Custom "custom";
actor {

  
/*Challenge 1 : Create two files called custom.mo and main.mo, create your own type inside custon.mo and import it in your main.mo file. In main, create a public function fun that takes no argument but return a value of your custom type.
Note : Be creative */
    public type TextLabel = {
        text: Text;
        senti: Text;
        labeled: Bool;
    }

}
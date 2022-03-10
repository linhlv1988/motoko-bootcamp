import Nat "mo:base/Nat";
import Text "mo:base/Text";
import Buffer "mo:base/Buffer";
import Char "mo:base/Char";
import Nat8 "mo:base/Nat8";
import Blob "mo:base/Blob";
import Nat32 "mo:base/Nat32";
import Error "mo:base/Error";
import Option "mo:base/Option";
import Custom "custom";
import Animal "animal";
import List "mo:base/List";

actor {

/*Challenge 1 : Create two files called custom.mo and main.mo, create your own type inside custon.mo and import it in your main.mo file. In main, create a public function fun that takes no argument but return a value of your custom type.
Note : Be creative */
  public type TextLabel = Custom.TextLabel;

  public func fun(): async TextLabel{
    return{
      text = "The house is beautiful";
      senti = "positive";
      labeled = true;
    };
  };

       /* Challenge 2 : Create a new file called animal.mo with at least 2 property (specie of type Text, energy of type Nat), 
    import this type in your main.mo and create a variable that will store an animal. */
  public type Animal = Animal.Animal;
  

  /* Challenge 4 : In main.mo create a public function called create_animal_then_takes_a_break that takes two parameter : 
  a specie of type Text, an number of energy point of type Nat and returns an animal.
   This function will create a new animal based on the parameters passed and then put this animal 
   to sleep before returning it !  */
  public func create_animal_then_takes_a_break(s: Text, e_point: Nat): async Animal {
      let animal : Animal = {
        specie = s;
        enery = e_point;
      };
      return Animal.animal_sleep(animal);
    };



  /* Challenge 5 : In main.mo, import the type List from the base Library and create a list that stores animal. */
  public type List<Animal> = ?(Animal, List<Animal>);


  /* Challenge 6 : In main.mo : create a function called push_animal that takes an animal as parameter 
  and returns nothing this function should add this animal to your list created in challenge 5.
   Then create a second functionc called get_animals that takes no parameter but returns 
   an Array that contains all animals stored in the list. */
   var animals = List.nil<Animal>();
   public func push_animal(a: Animal): async () {
    animals := List.push<Animal>(a, animals);
  };

   public func get_animals(): async [Animal] {
    return List.toArray(animals);
  };

}

import List "mo:base/List";

module{
    public type List<T> = ?(T, List<T>);

      /* Challenge 7 : Write a function is_null that takes l of type List<T> and returns a boolean indicating if the list is null .
   Tips : Try using a switch/case. */
    public func is_null<T>(l : List <T>) : Bool {
        switch l {
        case null 
            return true;
        case _ 
            return false;
        }
    };

     /* Challenge 8 : Write a function last that takes l of type List<T> and returns the optional last element of this list. */
    public func last<T>(l : List<T>) : ?T {
        switch l {
        case null 
            return null;
        case (?(x, null))
            return ?x;
        case (?(_, t))
            return last<T>(t);
        }
    };

  /* Challenge 9 : Write a function size that takes l of type List<T> and returns a Nat indicating the size of this list.
Note : If l is null , this function will return 0. */
    public func size<T>(l : List<T>) : Nat {
        func recursion(l : List<T>, n : Nat) : Nat {
            switch l {
                case null
                    return n;
                case (?(_, t))
                    return recursion(t, n + 1);
            };
        };
        recursion(l,0);
    };

    /* Challenge 10 : Write a function get that takes two arguments : l of type List<T> and n of type Nat this function should return the optional value at rank n in the list.*/
    public func get<T>(l : List<T>, n : Nat) : ?T {
        switch (n, l) {
            case (_, null)
                return null;
            case (0, (?(h, t))) 
                return ?h;
            case (_, (?(_, t))) 
                return get<T>(t, n - 1);
        };
    };

     /* Challenge 11 : Write a function reverse that takes l of type List and returns the reversed list.*/
    public func reverse<T>(l : List<T>) : List<T> {
    func recursion(l : List<T>, r : List<T>) : List<T> {
        switch l {
            case null 
                return r;
            case (?(h, t)) 
                return recursion(t, ?(h, r));
            }
        };
        recursion(l, null);
    };

}
import List "mo:base/List";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import HashMap "mo:base/HashMap";
import Iter "mo:base/Iter";
import Principal "mo:base/Principal";

actor {

    let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

    // 5. Add a function called get_usernames that will return an array of tuples (Principal, Text) which contains all the entries in usernames.
    public shared ({ caller }) func add_username(name : Text) : async () {
      usernames.put(caller, name);
    };

    public func get_usernames() : async [(Principal, Text)] {
        return Iter.toArray(usernames.entries());
    };
    
    // 1. Write a function unique that takes a list l of type List and returns a new list with all duplicate elements removed.
    func unique<T>(l : List.List<T>, equal : (T, T) -> Bool) : List.List<T> {
        var r : [T] = [];
        let list = List.toIter(l);
        for (x in list) {
            var found = false;
            for (y in r.vals()) {
                if (equal(x, y)) {
                    found := true; 
                };
            };
            if (found == false) {
                r := Array.append(r, [x]);
            };
        };
        return List.fromArray<T>(r);
    };

    // 2. Write a function reverse that takes l of type List and returns the reversed list.
    func reverse<T>(l: List.List<T>) : List.List<T> {
        func rv(l : List.List<T>, ret : List.List<T>) : List.List<T> {
            switch (l) {
                case null {
                    return ret;
                };
                case (?(p, list)) {
                    return rv(list, ?(p, ret));
                };
            };
        };
        rv(l, null);
    };

    // 3. Write a function is_anonymous that takes no arguments but returns a Boolean indicating if the caller is anonymous or not.
    public shared (msg) func is_anynomous() : async Bool {
        return Principal.toText(msg.caller) == "2vxsx-fae";
    };

    // 4. Write a function find_in_buffer that takes two arguments, buf of type Buffer and val of type T, and returns the optional index of the first occurrence of "val" in "buf".
    func find_in_buffer<T>(buf : Buffer.Buffer<T>, val : T, equal : (T,T) -> Bool) : ?Nat {
        var index : Nat = 0;
        for (x in buf.vals()) {
            if (equal(val, x)) {
                return (?index);
            };
            index += 1;
        };
        return null;
    };
}
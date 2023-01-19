import Array "mo:base/Array";

module Utils = {

    // 1.In your file called utils.mo: create a function called second_maximum that takes an array [Int] of integers and returns the second largest number in the array.
    public func second_maximum(array : [Nat]) : Nat {
        var max_1_st = 0;
        var max_2_nd = 0;
        for (i in array.vals()) {
            if (i > max_1_st) {
                if (max_1_st > max_2_nd) max_2_nd := max_1_st;
                max_1_st := i;
            } else if (i < max_1_st) {
                if (i > max_2_nd) max_2_nd := i;
            };
        };
        return max_2_nd;
    };

    // 2. In your file called utils.mo: create a function called remove_even that takes an array [Nat] and returns a new array with only the odd numbers from the original array.
    public func remove_even(array : [Nat]) : [Nat] {
        let ret = Array.filter<Nat>(array, func x = x % 2 == 1);
        return ret;
    };

    private func array_drop<T>(index : Nat, array : [T], n : Nat) : [T] {
        if (index >= array.size()) {
            return [];
        };
        let ret = array_drop(index + 1, array, n);
        if (index < n) {
            return ret;
        };
        return Array.append([array[index]], ret);
    };

    // 3. In your file called utils.mo: write a function drop that takes 2 parameters: an array [T] and a Nat n. This function will drop the n first elements of the array and returns the remainder.
    public func drop<T>(array : [T], n : Nat) : [T] {
        return array_drop(0, array, n);
    };
}
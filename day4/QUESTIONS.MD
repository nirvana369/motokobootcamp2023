# <a id="questions"> 🙋 Questions </a>
1. Is the heap memory saved when upgrading a canister? How much heap memory does a canister has?
	> Answer : No. 8GB
2. How much accounts can a unique Principal own?
	> Answer : 2^32
3.  Can we safely upgrade a canister from interface A to interface B?
    ```
    Interface A
	actor {
        public func greet(surname : Text, firstname : Text) : async Text {
            return "Hello" # firstname # surname # " !";
        };
    }
    ```motoko
    Interface B
    ```motoko
    actor {
        public func greet(firstname : Text) : async Text {
            return "Hello" # firstname # " !";
        };
    }
	```
	> Answer : Yes
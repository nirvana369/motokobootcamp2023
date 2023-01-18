# <a id="questions"> 🙋 Questions </a>
1. Who controls the ledger canister?
	> Answer : Network Nevous System
2. What is the subnet of the canister with the id: mwrha-maaaa-aaaab-qabqq-cai? How much nodes are running this subnet?
	> Answer : Subnet of the canister id mwrha-maaaa-aaaab-qabqq-cai is **pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe** and 16 nodes are running this subnet.
3. I have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?
	> Answer : voting power is 16.86 (AMOUNT ICP TOKENS * DISSOLVE DELAY BONUS * AGE BONUS)
    > AMOUNT ICP TOKENS = 10
    > DISSOLVE DELAY BONUS = 1.06 + (12 * 3 + 6) * (2  - 1.06) / (7 * 12 + 6)
    > AGE BONUS = 1.125
4.  What is wrong with the following code?
    ```
	actor {
        let n : Nat = 50;
        let t : Text = "Hello";

        public func convert_to_text(m : Nat) : async Text {
            Nat.toText(m);
        };
        
    }
	```
	> Answer : missing **import Nat "mo:base/Nat";** && n and t not use
	```
	import Nat "mo:base/Nat";

    actor {
        public func convert_to_text(m : Nat) : async Text {
            Nat.toText(m);
        };
    }
	```
5.  What is wrong with the following code?
    ```
	actor {
        var languages : [var Text] = ["English", "German", "Chinese", "Japanese", "French"];

        public func show_languages(language : Text) : async [var Text] {
            return (languages);
        };
    
    }
	```
	> Answer : change languages type and function return value to [Text] && function parameters not use
	```
	actor {
        var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

        public func show_languages(language : Text) : async [Text] {
            return (languages);
        };
    }
	```
6.  What is wrong with the following code?
    ```
	actor {
        var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

        public func add_language(new_language: Text) : async [Text] {
            languages := Array.append<Text>(languages, [new_language]);
            return (languages);
        };
    }
	```
	> Answer : missing **import Array "mo:base/Array";**
    ```
    import Array "mo:base/Array";

	actor {
        var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

        public func add_language(new_language: Text) : async [Text] {
            languages := Array.append<Text>(languages, [new_language]);
            return (languages);
        };
    }
	```
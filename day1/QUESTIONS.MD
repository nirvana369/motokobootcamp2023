# <a id="questions"> 🙋 Questions </a>
1. How much is the current memory capacity of a canister?
	> Answer : **48 GB**
2. What is the issue with the following code sample?
	> Answer : use **var** to declare counter (use let when variable only read/immutable)
	```
	actor {
	  let counter : Nat = 0;
	  public func increment_counter() : async () {
	    counter := counter + 1;
	  };
	}
	```
3. What is the issue with the following code sample?
	> Answer : **message** is type Text so you can't assign 0, must use string instead
	```
	actor {
	  var message : Text = 0;

	  public query func change_message(new_message : Text) : async () {
	    message := new_message;
	    return;
	  };
	  
	  public query func see_message() : async Text {
	    return(message);
	  };
	}
	```
4.  False or True: we can remove the keyword **async** for return argument of a query function since queries are faster to answer.
	> Answer : **True**
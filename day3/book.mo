module Books = {

    // 4. In your file called book.mo create a custom type with at least 2 properties (title of type Text, pages of type Nat), import this type in your main.mo and create a variable that will store a book.
    public type Book = {
        name: Text;
        pages: Nat;
    };

    // 5. In your file called book.mo create a function called create_book that takes two parameters: a title of type Text, and a number of pages of type Nat and returns a book. This function will create a new book based on the parameters passed.
    public func create_book(n : Text, p : Nat) : Book {
        let ret : Book = {name = n; pages = p;};
        return ret;
    };
};
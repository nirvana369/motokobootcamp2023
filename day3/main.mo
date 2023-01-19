import Books "book";
import Utils "utils";
import List "mo:base/List";

actor {
    type Book = Books.Book;
    
    var book : Book = {name = "Hello"; pages = 3;};

    // 6. In main.mo import the type List from the Base Library and create a list that stores books.
    var list : List.List<Book> = List.nil<Book>();

    // 7. In main.mo create a function called add_book that takes a book as parameter and returns nothing this function should add this book to your list. Then create a second function called get_books that takes no parameter but returns an Array that contains all books stored in the list.
    public func add_book(book : Book) : async() {
        list := List.push<Book>(book, list);
    };

    public func get_books() : async [Book] {
        return List.toArray<Book>(list);
    };
};
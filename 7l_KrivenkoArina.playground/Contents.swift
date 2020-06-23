import UIKit

struct Item {
    var count: Int
    let book: Book
}

struct Book{
    let name: String
}

enum LibraryError: Error {
    case noBookWithSuchName
    case outOfBooks
}
class Library {

    var bookChoice = [
        "Harry Potter": Item(count: 1, book: Book(name: "Harry Potter")),
        "Dead Souls": Item(count: 0, book: Book(name: "Dead Souls")),
        "Crime and Punishment": Item(count: 3, book: Book(name: "Crime and Punishment"))
    ]

// !!! Неактивный код ниже - это второе задание с Error

//    func takeBook(itemNamed name: String) -> (Book?, LibraryError?) {
//            guard let item = bookChoice[name] else {
//                return (nil, LibraryError.noBookWithSuchName)
//            }
//            guard item.count > 0 else {
//                return (nil, LibraryError.outOfBooks)
//            }
//
//            var newItem = item
//            newItem.count -= 1
//            bookChoice[name] = newItem
//
//            return (newItem.book, nil)
//        }
//    }
//    let library = Library()
//    let take1 = library.takeBook(itemNamed: "Harry Potter")
//    let take2 = library.takeBook(itemNamed: "Dead Souls")
//    let take3 = library.takeBook(itemNamed: "Crime and Punishment")
//    print(take2)

//Теперь первое задание с try и catch

    func takeBook(itemNamed name: String) throws -> Book {
            guard let item = bookChoice[name] else {
                throw LibraryError.noBookWithSuchName
            }
            guard item.count > 0 else {
                throw LibraryError.outOfBooks
            }
          
            var newItem = item
            newItem.count -= 1
            bookChoice[name] = newItem
   
            return newItem.book
        
            let library = Library() //На этой строчке высвечивается желтая ошибка "Code after 'return' will never be executed". ПОчему так?
        do {
            _ = try library.takeBook(itemNamed: "Harry Potter")
        } catch LibraryError.noBookWithSuchName {
            print("Книга с таким названием еще не была написана")
        } catch LibraryError.outOfBooks {
            print("Все экземпляры этой книги уже кто-то забрал :(")
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

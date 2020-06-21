import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.


enum FamilyMembers: String {
   case mom = "мама", dad = "папа", son = "сын", daughter = "дочь"
}

enum MembersNames: String {
    case mom = "Лена", dad = "Артем", son = "Тихон", daughter = "Арина"
}

class Family: CustomStringConvertible {
    let familyType: FamilyMembers
    let age: Int
    let nameType: MembersNames
    
    var description: String {
        return "Член семьи \(familyType), возраст: \(age), имя: \(nameType)"
    }
    init(familyType: FamilyMembers, age: Int, nameType: MembersNames) {
        self.familyType = familyType
        self.age = age
        self.nameType = nameType
    }
    var evenAge: (Int) -> Bool = {
        (element: Int) -> Bool in
        return element % 2 == 0
    }

}

struct Queue<T> {
    var elements: [T] = []
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeLast()
        
        func isEven(age: Int) -> Bool {
          return age % 2 == 0
            
        }

    }
    
}

var queueFamily = Queue<Family>()
var evens = queueFamily.filter(isEven) //Почему здесь выдается ошибка? Функция isEven по какой-то причине не читается/видится. По какой?
print(evens)

queueFamily.push(Family(familyType: .mom, age: 38, nameType: .mom))  //Знаю, что глупый вопрос, но почему при выводе вместо "мама" пишется mom; вместо имени тоже?
queueFamily.push(Family(familyType: .dad, age: 39, nameType: .dad))
queueFamily.push(Family(familyType: .son, age: 10, nameType: .son))
queueFamily.push(Family(familyType: .daughter, age: 16, nameType: .daughter))

queueFamily.pop()
print(queueFamily)



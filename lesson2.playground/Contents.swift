import UIKit
//Функция, которая определяет, четное число или нет
print("Четное ли это число?")
func numbers_by2 (number: Int) {
    if (number % 2) == 0 {
        print (true)
    } else {
        print (false)
    }
}
numbers_by2(number: 57)
print("                                               ")

//Функция, которая определяет, делится ли число на три
print("Делится ли это число на три?")
func numbers_by3 (n: Int) {
    if (n % 3) == 0 {
        print (true)
    } else {
        print (false)
    }
}
numbers_by3(n: 12)
print("                                               ")

//Возрастающий массив из 100 чисел
print("Создайте возрастающий массив из 100 чисел")
var NumbersArray = Array (1...100)
print(NumbersArray)
print("                                               ")

//Четвертое задание с созданием нового массива, а не удалением чисел из старого
print("Удалите из массива все числа, которые делятся на два и не делятся на три")
func filter(num: [Int] ) -> [Int] {
    var result = [Int]()
    for val in num {
        if (val % 2 != 0) && (val % 3 == 0){
            result.append(val)
        }
    }
    return result
}
let result = filter(num: NumbersArray)
print(result)
print("                                               ")
//Второй вариант четвертого задания, только теперь с удалением чисел
func filter2(nums: inout [Int] ) {
    for index in stride(from: nums.count - 1, through: 0, by: -1){
        if (nums[index] % 2 == 0) || (nums[index] % 3 != 0){
            nums.remove(at: index)
        }
    }
}
filter2(nums: &NumbersArray)
print("                                               ")

//Задание с числами Фибоначчи
print("Массив, состоящий из 90 чисел Фибоначчи") //не знаю, почему при >90 чисел в программе выскакивает ошибка:( Может из-за слишком больших чисел (Int не поддерживает чересчур большие значения?)
func FibonacciNumbers (newArray: Array<Int>) -> Array<Int> {
    var newArray: [Int] = []
    var a = 0
    var b = 1
    newArray.append(b)
    for _ in 0...90 {
        let c = a + b
        newArray.append(c)
        a = b
        b = c
    }
    return newArray
}
var fibonacciArray = [Int]()
fibonacciArray = FibonacciNumbers(newArray: fibonacciArray)
print(fibonacciArray)

import UIKit

/*1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.

2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

5. Создать несколько объектов каждого класса. Применить к ним различные действия.

6. Вывести значения свойств экземпляров в консоль.*/

enum CarAction {
    case turnEngineOn, turnEngineOff, windowOpen, windowClose
    case speedUpMax, speedNormal
    case loadTruck, unloadTruck
}

class Car {
    let wheelAmount: Int
    var color: UIColor
    var isEngineOn: Bool = false
    var isWindowOpen: Bool = false
    
    init(wheelAmount: Int, color: UIColor) {
        self.wheelAmount = wheelAmount
        self.color = color
    }
    func executeAction(action: CarAction){
        switch action {
        case .turnEngineOff:
            guard isEngineOn else {
                print("Двигатель и так выключен")
                return
            }
            isEngineOn = false
        case .turnEngineOn:
            guard !isEngineOn else {
                print("Двигатель и так включен")
                return
            }
            isEngineOn = true
            
        case .windowClose:
            guard isWindowOpen else {
                print("Окна и так закрыты")
                return
            }
            isWindowOpen = false
            
        case .windowOpen:
        guard !isWindowOpen else {
            print("Окна и так открыты")
            return
        }
        
        default:
            print("Невозможно выполнить действие")
        }
    }
}

class SportCar: Car{
    var isSpeedUpMax: Bool = false
    
    override func executeAction(action: CarAction) {
        super.executeAction(action: action)
        switch action {
        case .speedNormal:
            guard isSpeedUpMax else {
                print("Спорткар и так едет с нормальной скоростью")
                return
            }
            
            isSpeedUpMax = false
        case .speedUpMax:
            guard !isSpeedUpMax else {
               print("Спорткар и так уже едет с максимально допустимой скоростью")
               return
           }
           
           isSpeedUpMax = true
            
        default:
            print("Действие не поддерживается спорткаром")
            return
        
        }
    }
}


class TrunkCar: Car {
    
    var currentBaggageUsedPlace: Int = 0
    
    init(capacity: Int, wheelAmount: Int, color: UIColor) {
        
        super.init(wheelAmount: wheelAmount, color: color)
    }
        override func executeAction(action: CarAction){
            super.executeAction(action: action)
            
            if action == .loadTruck {
                currentBaggageUsedPlace += 1
            }
            else if action == .unloadTruck {
                currentBaggageUsedPlace -= 1
            }
        }
}


let truck = TrunkCar(capacity: 240, wheelAmount: 16, color: .blue)

truck.executeAction(action: .loadTruck)
truck.executeAction(action: .turnEngineOn)
truck.executeAction(action: .windowOpen)

let sportCar = SportCar(wheelAmount: 4, color: .black)
sportCar.executeAction(action: .turnEngineOff)
sportCar.executeAction(action: .speedNormal)
sportCar.executeAction(action: .windowClose)


print("Truck: в багажнике \(truck.currentBaggageUsedPlace)кг, двигатель включен: \(truck.isEngineOn)")
print("SportCar: едет с супер огромной скоростью: \(sportCar.isSpeedUpMax), двигатель включен: \(sportCar.isEngineOn), окна открыты: \(sportCar.isWindowOpen)")

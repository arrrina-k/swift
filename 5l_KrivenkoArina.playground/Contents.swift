import UIKit

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//
//6. Вывести сами объекты в консоль.
enum CarAction {
    case turnEngineOn, turnEngineOff, windowOpen, windowClose
    case speedUpMax, speedNormal
    case loadTruck, unloadTruck
}

protocol CarActionExecutable {
    var color: UIColor { get set }
    var wheelAmount: Int { get set }
    var isEngineOn: Bool { get set }
    var isWindowOpen: Bool { get set }
    
    func execute (action: CarAction)
}

extension CarActionExecutable {
    mutating func execute (action: CarAction){
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
                isEngineOn = true
                return
            }
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


class SportCar: CarActionExecutable {
   
    func execute(action: CarAction) {
        switch action {
        case .speedNormal:
            guard isSpeedUpMax else {
                print("Спорткар и так едет с нормальной скоростью")
                return
            }
            isSpeedUpMax = true
        case .speedUpMax:
            guard !isSpeedUpMax else {
               print("Спорткар и так уже едет с максимально допустимой скоростью")
               return
           }
           isSpeedUpMax = false
            
        default:
            print("Действие не поддерживается спорткаром")
            return
        }
    }
    var color: UIColor
    var wheelAmount: Int = 8
    var isEngineOn: Bool
    var isWindowOpen: Bool
    var isSpeedUpMax: Bool
    
    init(color: UIColor, wheelAmount: Int, isEngineOn: Bool, isWindowOpen: Bool, isSpeedUpMax: Bool) {
        self.color = color
        self.wheelAmount = wheelAmount
        self.isEngineOn = isEngineOn
        self.isWindowOpen = isWindowOpen
        self.isSpeedUpMax = isSpeedUpMax
    
}
}

extension SportCar: CustomStringConvertible{
    var description: String{
        return "Спорткар с \(wheelAmount) колесами"
    }
}

class TrunkCar: CarActionExecutable {
   
    func execute(action: CarAction) {
        switch action {
        case .loadTruck:
            guard isTruckLoaded else {
                print("Все место уже заполнено")
                return
            }
            isTruckLoaded = true
        case .unloadTruck:
            guard !isTruckLoaded else {
               print("В прицепе и так уже ничего нет")
               return
           }
           isTruckLoaded = false
            
        default:
            print("Действие не поддерживается грузовиком")
            return
        }
    }
    var color: UIColor
    var wheelAmount: Int = 8
    var isEngineOn: Bool
    var isWindowOpen: Bool
    var isTruckLoaded: Bool
    
    init(color: UIColor, wheelAmount: Int, isEngineOn: Bool, isWindowOpen: Bool, isTruckLoaded: Bool) {
        self.color = color
        self.wheelAmount = wheelAmount
        self.isEngineOn = isEngineOn
        self.isWindowOpen = isWindowOpen
        self.isTruckLoaded = isTruckLoaded
    
}
}

extension TrunkCar: CustomStringConvertible{
    var description: String{
        return "Грузовик с \(wheelAmount) колесами "
    }
}

let truck = TrunkCar(color: .blue, wheelAmount: 16,  isEngineOn: true, isWindowOpen: false, isTruckLoaded: true)

truck.execute(action: .loadTruck)
truck.execute(action: .turnEngineOn)
truck.execute(action: .windowOpen)

let sportCar = SportCar(color: .black, wheelAmount: 4, isEngineOn: false, isWindowOpen: false, isSpeedUpMax: true)
sportCar.execute(action: .turnEngineOff)
sportCar.execute(action: .speedNormal)
sportCar.execute(action: .windowClose)


print("Truck: двигатель включен: \(truck.isEngineOn), прицеп загружен: \(truck.isTruckLoaded), окна открыты: \(truck.isWindowOpen)")
print("SportCar: едет с супер огромной скоростью: \(sportCar.isSpeedUpMax), двигатель включен: \(sportCar.isEngineOn), окна открыты: \(sportCar.isWindowOpen)")

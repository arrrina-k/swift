import Foundation

enum Manufacture: String {
    case mercedes, hyundai, volkswagen, porshe
}

enum CarAction {
    case turnOnEngine
    case openWindows
    case putInBaggage
    case turnOffEngine
    case closeWindows
    case putOutBaggage
}

struct Car {
    let manufacture: Manufacture
    var productionYear: Int
    var baggageSize: Int

    func engineOn(on: Bool) {
        print("Двигатель \(manufacture.rawValue) \(on ? "включен" : "выключен")")
    }
    func windowsOpen(on: Bool) {
        print("Окна \(manufacture.rawValue) \(on ? "открыты" : "закрыты")")
    }
    func baggageFull(on: Bool) {
        print("Багажник \(manufacture.rawValue) \(on ? "полный" : "пустой")")
    }
    func action (act: CarAction){
        switch act{
        case .turnOnEngine:
            engineOn(on: true)
        case .openWindows:
            windowsOpen(on: true)
        case .putInBaggage:
            baggageFull(on: true)
        case .closeWindows:
            windowsOpen(on: false)
        case .putOutBaggage:
            baggageFull(on: false)
        case .turnOffEngine:
            engineOn(on: false)
        }
//        В этой неработающей части кода мне постаянно выдает ошибку. Вроде все так же, как и на занятии было. В чем проблема?
//            init( manufacture: Manufacture) {
//                if manufacture == .hyundai {
//                    productionYear == 2010
//                    baggageSize == 200
//                }
//                else if manufacture == .porshe{
//                    productionYear == 2020
//                    baggageSize == 50
//                }
//                self.manufacture = manufacture
//            }

        }
    }

print("Данные о легковом автомобиле")
print("                                               ")

let passangersCar = Car(manufacture: .volkswagen, productionYear: 2019, baggageSize: 400)
print(passangersCar)
passangersCar.engineOn(on: true)
passangersCar.windowsOpen(on: false)
passangersCar.baggageFull(on: true)

print("                                               ")
print("Данные о грузовом автомобиле")
print("                                               ")

let baggageCar = Car(manufacture: .mercedes, productionYear: 2020, baggageSize: 610)
print(baggageCar)
baggageCar.engineOn(on: false)
baggageCar.windowsOpen(on: true)
baggageCar.baggageFull(on: false)




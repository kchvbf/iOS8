struct Car: Hashable {
    var brand: String 
    var year: Int 
    var trunkCapacity: Double 
    var engineIsOn: Bool 
    var windowsAreOpen: Bool
    var trunkLoad: Double
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(year)
        hasher.combine(trunkCapacity)
        hasher.combine(engineIsOn)
        hasher.combine(windowsAreOpen)
        hasher.combine(trunkLoad)
    }
    
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.brand == rhs.brand && lhs.year == rhs.year && lhs.trunkCapacity == rhs.trunkCapacity && lhs.engineIsOn == rhs.engineIsOn && lhs.windowsAreOpen == rhs.windowsAreOpen && lhs.trunkLoad == rhs.trunkLoad
    }
}

struct Truck: Hashable {
    var brand: String
    var year: Int
    var trunkCapacity: Double
    var engineIsOn: Bool
    var windowsAreOpen: Bool 
    var trunkLoad: Double
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(brand)
        hasher.combine(year)
        hasher.combine(trunkCapacity)
        hasher.combine(engineIsOn)
        hasher.combine(windowsAreOpen)
        hasher.combine(trunkLoad)
    }
    
    static func == (lhs: Truck, rhs: Truck) -> Bool {
        return lhs.brand == rhs.brand && lhs.year == rhs.year && lhs.trunkCapacity == rhs.trunkCapacity && lhs.engineIsOn == rhs.engineIsOn && lhs.windowsAreOpen == rhs.windowsAreOpen && lhs.trunkLoad == rhs.trunkLoad
    }
    
}

enum CarAction {
    case startEngine
    case stopEngine 
    case openWindows
    case closeWindows 
    case loadCargo(volume: Double)
    case unloadCargo(volume: Double)
}

extension Car {
    mutating func performAction(_ action: CarAction) {
        switch action {
        case .startEngine:
            engineIsOn = true
        case .stopEngine:
            engineIsOn = false 
        case .openWindows:
            windowsAreOpen = true
        case .closeWindows:
            windowsAreOpen = false
        case .loadCargo(let volume):
            guard trunkLoad + volume <= trunkCapacity else {
                print("В багажнике недостаточно места")
                return
            }
            trunkLoad += volume
        case .unloadCargo(let volume):
            guard trunkLoad - volume >= 0 else {
                print("В багажнике нет столько груза")
                return
            }
            trunkLoad -= volume
        }
    }
}

extension Truck {
    mutating func performAction(_ action: CarAction) {
        switch action {
        case .startEngine:
            engineIsOn = true
        case .stopEngine:
            engineIsOn = false
        case .openWindows:
            windowsAreOpen = true
        case .closeWindows:
            windowsAreOpen = false 
        case .loadCargo(let volume):
            guard trunkLoad + volume <= trunkCapacity else {
                print("В кузове нет места")
                return
            }
            trunkLoad += volume
        case .unloadCargo(let volume):
            guard trunkLoad - volume >= 0 else {
                print("В кузове недостаточно груза")
                return
            }
            trunkLoad -= volume
        }
    }
}

var car1 = Car(brand: "БМВ", year: 2020, trunkCapacity: 1000, engineIsOn: true, windowsAreOpen: true, trunkLoad: 450)
var car2 = Car(brand: "Марк II", year: 2002, trunkCapacity: 500, engineIsOn: false, windowsAreOpen: false, trunkLoad: 333)
var car3 = Car(brand: "Ауди", year: 2024, trunkCapacity: 800, engineIsOn: false, windowsAreOpen: true, trunkLoad: 666)


var truck1 = Truck(brand: "Мерседес", year: 2015, trunkCapacity: 13000, engineIsOn: true, windowsAreOpen: true, trunkLoad: 1337)
var truck2 = Truck(brand: "Камаз", year: 2016, trunkCapacity: 18000, engineIsOn: true, windowsAreOpen: true, trunkLoad: 1488)


car1.performAction(.stopEngine)
car1.performAction(.closeWindows)
car1.performAction(.loadCargo(volume: 150)) 


car2.performAction(.startEngine)
car2.performAction(.openWindows) 


car3.performAction(.closeWindows)


truck1.performAction(.loadCargo(volume: 666))
truck1.performAction(.startEngine) 

truck2.performAction(.unloadCargo(volume: 777)) 

var dict = [car1: "car1", car2: "car2", car3: "car3", truck1: "truck1", truck2: "truck2"] as [AnyHashable: String]

print("Записи в словаре \(dict as AnyObject)")
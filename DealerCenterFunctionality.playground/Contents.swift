// Протоколы машин и дилерских центров
protocol CarProtocol {
    var model: String {get}
    var color: String {get}
    var buildDate: Int {get}
    var price: Int {get set}
    var accessories: [String] {get set}
    var isServiced: Bool {get set}
    var id: Int {get}
}

protocol DealershipProtocol {
    var name: String {get}
    var showroomCapacity: [CarProtocol] {get}
    var stockCars: [CarProtocol] {get set}
    var showroomCars: [CarProtocol] {get set}
    var cars: [CarProtocol] {get set}

    func offerAccesories(_ car: inout CarProtocol, _ accessories: [String])
    func presaleService(_ car: inout CarProtocol)
    func addToShowroom(_ car: CarProtocol)
    func sellCar(_ car: inout CarProtocol, _ accessories: [String])
    func orderCar()
}


//MARK: - Cоздание автомобиля
// Bmw
struct BmwCar: CarProtocol {
    var model: String
    var color: String
    var buildDate: Int
    var price: Int
    var accessories: [String] = ["сигнализация", "спортивные диски", "тонировка"]
    var isServiced: Bool
    var id: Int
}
var bmw: CarProtocol = BmwCar(model: "BMW", color: "серый", buildDate: 2019, price: 2_000_000, accessories: ["сигнализация"], isServiced: false, id: 0)


//MARK: - Cоздание дилерского центра и их функционала
// Салон Bmw
class Bmw: DealershipProtocol {
    var name: String
    var showroomCapacity: [CarProtocol]
    var stockCars: [CarProtocol]
    var showroomCars: [CarProtocol]
    var cars: [CarProtocol]

    init(name: String,showroomCapacity: [CarProtocol], stockCars: [CarProtocol], showroomCars: [CarProtocol],cars: [CarProtocol]) {
        self.name = name
        self.showroomCapacity = showroomCapacity
        self.stockCars = stockCars
        self.showroomCars = showroomCars
        self.cars = cars
    }

//Метод предлагает клиенту купить дополнительное оборудование
    func offerAccesories(_ car: inout CarProtocol, _ accessories: [String]) {
        car.accessories += accessories
        print("Вы добавили дополнительные аксессуары")
    }

//Метод отправляет машину на предпродажную подготовку
    func presaleService(_ car: inout CarProtocol) {
        if car.isServiced == false {
            car.isServiced = true
            print("Автомобиль \(car.model) отправлен на предпродажную подготовку")
        } else {
            print("Автомобиль \(car.model) готов к продаже")
        }
    }

//Метод перегоняет машину с парковки склада в автосалон, при этом выполняет предпродажную подготовку
    func addToShowroom(_ car: CarProtocol) {
        for (index, value) in stockCars.enumerated() {
            if value.id == car.id {
                stockCars.remove(at: index)
            }
        }
        showroomCars.append(car)
        print("Автомобиль \(car.model), цвет: \(car.color), год выпуска: \(car.buildDate) доставлен в салон")
  }

//Метод продает машину из автосалона при этом проверяет, выполнена ли предпродажная подготовка
    func sellCar(_ car: inout CarProtocol, _ accessories: [String]) {
        if car.isServiced == false {
            car.isServiced = true
            print("Автомобиль \(car.model) отправлен на предпродажную подготовку")
        } else {
            print("Автомобиль \(car.model) готов к продаже")
            if car.accessories.isEmpty {
                print("Добавить дополнительное оборудование?")
                car.accessories += accessories
            }
            for (index, value) in showroomCars.enumerated() {
                if value.id == car.id {
                    showroomCars.remove(at: index)
                    print("Автомобиль \(car.model), цвет \(car.color), год выпуска: \(car.buildDate) продан")
                }
            }
        }
    }

//Метод делает заказ новой машины с завода
    func orderCar() {
        let newCar = BmwCar(model: "BMWAgain", color: "белый", buildDate: 2022, price: 5_000_000, accessories: ["тонировка"], isServiced: false, id: 10)
        stockCars.append(newCar)
        print("Автомобиль \(newCar.model) цвет:\(newCar.color), год выпуска: \(newCar.buildDate), находится на парковке склада")
    }
}

let bmwDealership = Bmw(name: "Дилерский центр BMV", showroomCapacity: [BmwCar(model: "BMWMini", color: "черный", buildDate: 2010, price: 1_000_000, accessories: ["сигнализация"], isServiced: true, id: 5)], stockCars: [BmwCar(model: "BMWwww", color: "черный", buildDate: 2012, price: 2_000_000, accessories: ["тонировка"], isServiced: true, id: 15)], showroomCars: [BmwCar(model: "BMWx1", color: "красный", buildDate: 2022, price: 3_500_000, accessories: ["сигнализация, тонировка"], isServiced: true, id: 20)], cars: [BmwCar(model: "BMWx5", color: "серый", buildDate: 2020, price: 2_000_000, accessories: ["сигнализация"], isServiced: true, id: 22)])

bmwDealership.addToShowroom(bmw)
bmwDealership.orderCar()
//print("-------------------------")

// MARK: - Определение слогана для дилерского центра
var dealerCenters = [DealershipProtocol]()
dealerCenters.append(bmwDealership)

for dealerCenter in dealerCenters {
    if  dealerCenter is Bmw {
        print("BMW: С удовольствием за рулем!")
    }
}
//print("-------------------------")

//MARK: - ОБРАБОТКА ОШИБОК

//Протокол для специального предложения (акции)
protocol SpecialOfferProtocol {
    func addEmergencyPack(_ car: inout CarProtocol)
    func makeSpecialOffer(_ car: inout CarProtocol) throws
}

//Ошибка для генерации
enum Errors: Error {
    case error
}

// Салон Bmw
// Расширение протокола для дилерского центра для проверки условям акции
extension Bmw: SpecialOfferProtocol {
    func addEmergencyPack(_ car: inout CarProtocol) {
        car.accessories += ["аптечка", "огнетушитель"]
        print("Аптечка и огнетушитель добавлены для \(car.model), цвет: \(car.color), год выпуска: \(car.buildDate)")
    }

    func makeSpecialOffer(_ car: inout CarProtocol) throws {
        guard car.buildDate < 2022 else { throw Errors.error }
        car.price = car.price - (car.price / 100 * 15)
        print("Вам предоставлена скидка в 15%. Новая цена \(car.model) \(car.price)")
        addEmergencyPack(&car)
    }
}

// Проверка на соотвесткие требованиям акции
do {
    try bmwDealership.makeSpecialOffer(&bmw)
} catch {
    print("Акция не распространяется на данный автомобиль!")
}
//print("--------")

//  Перемещение машины в салон, если она соотвествует акции
for (index, value) in bmwDealership.stockCars.enumerated() {
    var car = value
    if car.buildDate == 2022 {
            try? bmwDealership.makeSpecialOffer(&car)
        } else {
            bmwDealership.stockCars.remove(at: index)
            bmwDealership.showroomCars.append(car)
        print("Автомобиль \(car.model), цвет: \(car.color), год выпуска: \(car.buildDate) доставлен в салон")
    }
}
//print("--------")

// Предупреждение, если машина соотвествующая условиям акции уже находится в салоне и
for car in bmwDealership.showroomCars {
    var car = car
    do {
        try bmwDealership.makeSpecialOffer(&car)
    } catch {
        print("Акция не распространяется на \(car.model), цвет: \(car.color), год выпуска: \(car.buildDate)")
    }
}



import UIKit

// Вариант №1 Словарь
// Ключ словаря  - название остановки, значение - время движения от начала маршрута  троллейбуса (от 0 мин)

let trolleyStationTime: [String:Int] = ["улица Набокова":0,
                                        "сквер Ивана Бунина":5,
                                        "переулок Джойса":9,
                                        "аллея По":12,
                                        "площадь Пастернака":15,
                                        "улица Поля Верлена":19,
                                        "Литературный проспект":24]


func trolleyWayTime (from start: String, to finish: String) -> Int {
    var distance:Int
    if let stationStart = trolleyStationTime[start],
       let stationEnd = trolleyStationTime[finish] {
        distance = stationEnd - stationStart
        if distance < 0 {
            distance = -distance
        }
    } else {
        print("Такой станции нет")
        return 0
    }
    return distance
}

trolleyWayTime(from: "улица Набокова", to: "площадь Пастернака")
trolleyWayTime(from: "площадь Пастернака", to: "улица Набокова")
trolleyWayTime(from: "площадь Пастернака", to: "улица Нбокова")


// Вариант №2 Массивы
let trolleyStation = ["улица Набокова", "сквер Ивана Бунина","переулок Джойса", "аллея По", "площадь Пастернака", "улица Поля Верлена", "Литературный проспект"]

let trolleyTime = [0, 5, 9, 12, 15, 19, 24] // время движения от начала маршрута  троллейбуса (от 0 мин)

func trolleyWayTimeTwo (from start: String, to finish: String) -> Int {
    let dictionary = zip(trolleyStation, trolleyTime)
    let trolleyStationTime = Dictionary(dictionary, uniquingKeysWith: {return $1})
    var distance:Int
    if let stationStart = trolleyStationTime[start],
       let stationEnd = trolleyStationTime[finish] {
        distance = stationEnd - stationStart
        if distance < 0 {
            distance = -distance
        }
    } else {
        print("Такой станции нет")
        return 0
    }
    return distance
}

trolleyWayTimeTwo(from: "улица Набокова", to: "площадь Пастернака")
trolleyWayTimeTwo(from: "площадь Пастернака", to: "улица Набокова")
trolleyWayTimeTwo(from: "площадь Пастернака", to: "улица Нбокова")


// Вариант №3 Словарь и массив
// Ключ словаря - название остановки, значение - отсчет становок, начиная от старта маршрута троллейбуса, т.е. с 0

let trolleyStationTwo = ["улица Набокова":0,
                         "сквер Ивана Бунина":1,
                         "переулок Джойса":2,
                         "аллея По": 3,
                         "площадь Пастернака":4,
                         "улица Поля Верлена":5,
                         "Литературный проспект":6]

let trolleyTimeTwo = [0, 5, 9, 12, 15, 19, 24] // время движения от начала маршрута  троллейбуса (от 0 мин)

func trolleyWayTimeThree (from start: String, to finish: String) -> Int {
    var distance:Int = 0
    if let stationStart = trolleyStationTwo[start],
       let stationEnd = trolleyStationTwo[finish] {
        for (index, value) in trolleyTimeTwo.enumerated() {
            for (index1, value1) in trolleyTimeTwo.enumerated() {
                if index == stationStart,
                   index1 == stationEnd {
                    distance = value1 - value
                    if distance < 0 {
                        distance = -distance
                    }
                }
            }
        }
    } else {
        print("Такой станции нет")
        return 0
    }
    return distance
}

trolleyWayTimeThree(from: "улица Набокова", to: "площадь Пастернака")
trolleyWayTimeThree(from: "площадь Пастернака", to: "улица Набокова")
trolleyWayTimeThree(from: "площадь Пастернака", to: "улица Нбокова")

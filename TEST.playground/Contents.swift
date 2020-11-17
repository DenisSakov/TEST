import UIKit



//: # 1. (1 балл за каждый пункт)
//: ### 1.1 Что такое значимый (value) и  ссылочный(reference) тип? Приведите примеры.
// Значимый тип относиться к структурам, ссылочный к классам.
//: ### 1.2 Чем отличается “struct“ от “class”?
//Class может наследоваться от другога класса, наследовать свойства класса, структура такими возможностями не обладает. Class передает значения по ссылке, структура значение копирует.

//: ### 1.3 Что такое Опционал(optional value)? Какие способы “unwrapping” для опционала вы знаете?
//optional value - объект который либо имеет значение либо нет
var optional: String?

// 1. if let
if let someString = optional {
    print(someString)
}

// 2. guard
//guard let someAnotherString = optional else { return }
//print(someAnotherString)

// 3. force unwrap
//optional!


//: ### 1.4 Какие Коллекции(Collection types) вы знаете? Приведите примеры использования каждого из них(т.е. какую коллекцию для каких задач рациональнее использовать).

// массивы
var array: Array<Int> = [1, 2, 3]
print(array)

// сеты
var set: Set<Int> = [1, 2, 2, 2, 2, 3, 4]
print(set)

// словари
var dict: [String: Int] = ["key1": 1,
                           "key2": 2]
print(dict)

//: ### 1.5 Что такое замыкание(Closure)? Приведите примеры использования.

//: ### 1.6 Что такое enum? Что такое raw и associated value?
//enum можно назват перечисление, хорошо использовать в структуре. Как пример пункт 2.1

//: ### 1.7 Как вы понимаете основные понятия/принципы ООП: Наследование, инкапсуляция, полиморфизм? Приведите примеры.
// Наследование хорошо понимаеться в работе с классами, когда один класс наследует методы из другого класса.
// Инкапсуляция - ограничение доступа к некоторым методам класса.
// полиморфизм - взаимозаменяемость типов в одной иерархии классов.
//: ### 1.8 Для чего существуют операторы "if" и "switch"? Чем они отличаются?

//: ### 1.9 Что такое Extension и Protocol. Для чего они предназначены? Какие принципы ООП они реализовывают?

//: # 2. (2 балла за каждый пункт)
//:  2.1 Опишите enum который будет отражать общие состояния погоды(ясно, облачно, осадки и тд). Для тех состояний погоды, для которых возможно, опишите assosiated values с количеством осадков.

enum Weather {
    case clearSky
    case cloudy
    case rainy(mm: Int)
}

let currentWeather: Weather = .rainy(mm: 30)

//:  2.2 Опишите функцию minValue, которая принимает 2 аргумента и возвращает меньшее из этих значений.
func minValue(first: Int, second: Int) -> Int {
//    if first > second {
//        return second
//    } else {
//        return first
//    }
    
    let final = (first > second) ? second : first
    return final
}

minValue(first: 10, second: 4)
minValue(first: 12, second: 14)


//:  2.3 Для следующего объекта типа String выведите все строки короче 10 символов, которые начинаются на "a" или "A" и все строки начинающиеся на b или "B"
let strings = ["adfkjsd", "Akdsfjkdfjldfjk", "bdkk", "kaf", " afurl", "ABBA", "ABBBBBBBBBBBBBBBBA", "no", "1234566dkjdksdjksd", "bbbbbbbbbbbbbbbbbbbb", "Ваc?"]
let elements = strings.filter { $0.count < 10 }
let elementsA = elements.filter { a in return a.hasPrefix("A") }

let filteredStrings = strings.filter { ($0.count < 10) && (($0.hasPrefix("a") || $0.hasPrefix("A")) || ($0.hasPrefix("b") || $0.hasPrefix("B"))) }
print(filteredStrings)

//:  2.4 Опишите функцию, которая принимает номер дня недели и возвращает название дня недели.
func dayOfWeek(dayNumber: Int) -> String? {
    switch dayNumber {
    case 1:
        return "Monday"
    case 2:
        return "Tuesday"
    case 3:
        return "Wednsdya"
    case 4:
        return "Thursday"
    case 5:
        return "Friday"
    case 6:
        return "Saturday"
    case 7:
        return "Sunday"
    default:
        return nil
    }
}

dayOfWeek(dayNumber: 1)
dayOfWeek(dayNumber: 4)


//:  2.5 Опишите функцию, которая получает время в качестве трех аргументов (часы, минуты, секунды) и возвращает время в качестве (с тремя этими компонентами). С помощью typealias можете назвать исходящий тип по-своему.

typealias TimeFormat = (hour: Int, minute: Int, seconds: Int)
typealias CustomTimeFormat = String


func getTime(time: TimeFormat) -> CustomTimeFormat {
    return "Time is: \(time.hour):\(time.minute):\(time.seconds)"
}

getTime(time: (13, 20, 45))


//: 2.6 Опишите функцию, принимающую время в виде кортежа, описанного в предыдущем задании, конвертирует полученное время в секунды и возвращает значение Int(количество секунд)
func convertTimeToSeconds(time: TimeFormat) -> Int {
    return (time.hour * 60 * 60) + (time.minute * 60) + (time.seconds)
}

convertTimeToSeconds(time: (2, 12, 40))


//:  2.7 Опишите функцию обратную функции из предыдущего задания, принимающую 1 аргумент - количество секунд(например 1500) и конвертирует полученное время в формат кортежа (часы, минуты, секунды) из пункта 2.5

func convertSecondsToCustomTimeType(seconds: Int) -> TimeFormat {
    let fullHours = seconds / 60 / 60
    let minsAndSeconds = seconds - (fullHours * 60 * 60)
    let fullMinutes = minsAndSeconds / 60
    let fullSeconds = minsAndSeconds - (fullMinutes * 60)
    
    return (fullHours, fullMinutes, fullSeconds)
}

convertSecondsToCustomTimeType(seconds: 7960)

//:  2.8 Объявите переменную которая будет иметь тип Closure(замыкание), которое принимает аргументы Int и String и возвращает массив String. Присвойте ей реализацию, которая повторит в массиве строку n раз. Выполните эту функцию, передав ей число 7 и строку "test".

typealias myClosure = (String, Int) -> ([String])

var repeatFunction: myClosure = { (stringToRepeat, count) in
    return Array(repeating: stringToRepeat, count: count)
}

repeatFunction("test", 7)


//:  2.9 Используя функцию `filter', получите массив только с городами с населением более 15 млн человек
struct City {
    let population: Int
    let country: String
    let name: String
}

let citiesArray = [City(population: 24_256_800, country: "Китай", name: "Шанхай"),
                   City(population: 23_500_000, country: "Пакистан", name: "Карачи" ),
                   City(population: 21_516_000, country: "Пекин", name: "Китай"),
                   City(population: 16_349_831, country: "Индия", name: "Дели"),
                   City(population: 16_060_303, country: "Нигерия", name: "Лагос"),
                   City(population: 15_200_000, country: "Китай", name: "Тяньцзинь"),
                   City(population: 14_160_467, country: "Турция", name: "Стамбул"),
                   City(population: 13_513_734, country: "Япония", name: "Токио"),
                   City(population: 13_080_500, country: "Китай", name: "Гуанчжоу"),
                   City(population: 12_442_373, country: "Индия", name: "Мумбаи"),
                   City(population: 12_197_596, country: "Россия", name: "москва"),
                   City(population: 11_895_893, country: "Бразилия", name: "Сан-Паулу"),
                   City(population: 10_467_400, country: "Китай", name: "Шэньчжэнь"),
                   City(population: 10_075_310, country: "Индонезия", name: "Джакарта"),
                   City(population: 10_052_000, country: "Пакистан", name: "Лахор"),]

let filtered = citiesArray.filter { $0.population > 15_000_000 }
filtered.count
print(filtered)


//: # 3. (5 баллов за каждый пункт)
//: ### Представьте себе задачу по разработке приложения для домашней климатической техники. В рамках данной задачи вам необходимо выполнить следующее:
/*:
 3.1 Опишите базовый класс HomeSensor, который содержит несколько общих свойств для разных датчиков (например: датчик влажности, температуры, CO2):
 - значение измеряемого параметра данным датчиком value,
 - название измеряемого параметра,
 - целевое значение параметра - идальный показатель (targetValue),
 - точность в процентах (погрешность датчика),
 - id датчика
 - Опишите Void(Ничего не возвращающую) функцию "output" с пустым телом (т.е. что бы она ничего не делала)
*/

class HomeSensor {
    let id: Int
    let name: String
    var value: Int {
        didSet {
            if value > targetValue {
                print("Value больше, чем targetValue")
            }
        }
    }
    let targetValue: Int
    let fault: Int
    
    init(id: Int, name: String, value: Int, targetValue: Int, fault: Int) {
        self.id = id
        self.name = name
        self.value = value
        self.targetValue = targetValue
        self.fault = fault
    }
    
    func output() {
        
    }
}
 
 /*
 3.2 Опишите наследуемые классы для каждого типа датчиков (HumiditySensor, TemperatureSensor, COSensor)
 3.3 В дочерних классах переопределите функцию Output, что бы она выводила описание типа "Температура на датчике 13 равна 15ºС +/- 1ºС. Целевое значение - 19ºС"
 */

 class HumiditySensor: HomeSensor {
    
    var targetValueMin: Int?
     
     override func output() {
         print("\(name) на датчике \(id) равна \(value)% +/- \(fault)%. Целевое значение - \(targetValue)")
     }
    
    func setTargetRange(targetValueMin: Int, targetValueMax: Int) {
        guard targetValue > targetValueMin && targetValue < targetValueMax else { return }
        
        self.targetValueMin = targetValueMin
    }
     
 }

 class TemperatureSensor: HomeSensor {
    
    var targetValueMin: Int?
     
     override func output() {
         print("\(name) на датчике \(id) равна \(value)ºС +/- \(fault)ºС. Целевое значение - \(targetValue)")
     }
    
    func setTargetRange(targetValueMin: Int, targetValueMax: Int) {
        guard targetValue > targetValueMin && targetValue < targetValueMax else { return }
        
        self.targetValueMin = targetValueMin
    }
     
 }

 class COSensor: HomeSensor {
    
    var targetValueMin: Int?
     
     override func output() {
         print("\(name) на датчике \(id) равна \(value)% +/- \(fault)%. Целевое значение - \(targetValue)")
     }
     
    func setTargetRange(targetValueMin: Int, targetValueMax: Int) {
        guard targetValue > targetValueMin && targetValue < targetValueMax else { return }
        
        self.targetValueMin = targetValueMin
    }
 }
 
 /*
 3.4 Опишите класс для комнаты(Room), который может содержать несколько сенсоров(HomeSensor) в одном свойстве c названием sensors. Так же Room должно содержать свойство - название комнаты.
 */

class Room {
    let name: String
    let sensors: [HomeSensor]
    
    init(name: String, sensors: [HomeSensor]) {
        self.name = name
        self.sensors = sensors
    }
}
 

 /*
 3.5 Опишите класс Home, который может содержать несколько комнат(Room) в одном свойстве c названием rooms, а также опишите в нем функцию, которая выводит в консоль показания всех датчиков в каждой комнате, используя метод output
 */

class Home {
    let rooms: [Room]
    
    init(rooms: [Room]) {
        self.rooms = rooms
    }
    
    func output() {
        for room in rooms {
            for sensor in room.sensors {
                sensor.output()
            }
        }
    }
}


/*:
 Продемонстрируйте работу:
 - Создайте 1 экземпляр класса Home и  3 экземпляра Room (кухня, гостинная, спальня). Добавьте созданные экземпляры комнат в объект Home (в проперти rooms объекта Home)
 - Создайте и добавьте несколько экземпляров датчиков в каждую комнату
 - У объекта Home вызовите функцию, которая выводит в консоль показания всех датчиков в каждой комнате
 */

let co2KitchenSensor = COSensor(id: 12, name: "CO2 Сенсор", value: 60, targetValue: 80, fault: 30)
let kitchen = Room(name: "Кухня", sensors: [co2KitchenSensor])

let tempLivingRoomSensor = TemperatureSensor(id: 14, name: "Температурный датчик", value: 20, targetValue: 23, fault: 2)
let humiditylivingRoomSensor = HumiditySensor(id: 3, name: "Датчик влажности", value: 34, targetValue: 55, fault: 5)
let livingRoom = Room(name: "Гостиная", sensors: [tempLivingRoomSensor, humiditylivingRoomSensor])

let tempBedroomSensor = TemperatureSensor(id: 28, name: "Температурный датчик", value: 18, targetValue: 23, fault: 3)
let co2BedroomSensor = COSensor(id: 2, name: "CO2 Сенсор", value: 62, targetValue: 60, fault: 32)
let bedroom = Room(name: "Спальня", sensors: [tempBedroomSensor, co2BedroomSensor])

let myHome = Home(rooms: [kitchen, livingRoom, bedroom])
myHome.output()


//: Дополнительное задание:
/*:
 Для каждого датчика:
 - опишите дополнительное значение нижнего предела targetValueMin
 - опишите метод, устанавливающий targetValueMin и targetValueMax, предусмотрите валидацию введенного значения (чтобы с точки зрения контекста каждого измерения не нарушалась логика)
 - в didSet проперти value предусмотрите сообщение в консоль в случае если новое значение больше, чем targetValue
 */

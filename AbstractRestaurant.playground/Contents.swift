
// Протокол "Ресторан"
protocol Restaurant {
    var name: String {get}
    var employees: [Employee] {get set}
    var storehouse: [Foodstuff] {get set}
    var menu: [Dish] {get set}

    func open()
    func close()
    func createMenu(dish: Dish)
    func hireEmployee()
    func orderFoodstuff(ingredient: Foodstuff)
}

// Протокол "Сотрудник"
enum Gender {
    case female
    case male
}

protocol Employee {
    var position: String {get set}
    var name: String {get}
    var gender: Gender {get}
    var age: Int {get}
}

// Протокол "Блюдо"
enum DishType: String {
    case salad = "салат"
    case soup = "суп"
    case mainDish = "основное блюдо"
    case sideDish = "гарнир"
    case dessert = "десерт"
}

protocol Dish {
    var type: DishType {get}
    var ingredients: [Ingredient] {get}
    var cookTime: Int {get set}
    var price: Float {get set}

    func prepareIngredients()
    func cookDish()
}

// Протокол "Заказ"
protocol Order {
    var takeOrderTime: Int {get}
    var giveOrderTime: Int {get}
    var dish: [Dish] {get set}
    var isCooked: Bool {get set}

    func createOrder(dish: Dish)
    func checkStatus(dish: Dish)
    func getOrder(takeOrderTime: Int, giveOrderTime: Int)
    func complainAboutOrder()
}

// Сотрудники реcторана
class Manager: Employee {
    var position = "менеджер"
    var name: String
    var gender: Gender
    var age: Int

    init(name: String, gender: Gender, age: Int) {
        self.name = name
        self.gender = gender
        self.age = age
    }

    func manage() {}
    func solveProblems() {}
}

class Chef: Employee {
    var position = "шеф-повар"
    var name: String
    var gender: Gender
    var age: Int

    init(name: String, gender: Gender, age: Int) {
        self.name = name
        self.gender = gender
        self.age = age
    }

    func cook() {}
    func giveTask() {}
}

class CookOfColdShop: Employee {
    var position = "повар холодного цеха"
    var name: String
    var gender: Gender
    var age: Int

    init(name: String, gender: Gender, age: Int) {
        self.name = name
        self.gender = gender
        self.age = age
    }

    func cook() {}
    func makeSauce() {}
    func makeSalade() {}
}

class CookOfHotShop: Employee {
    var position = "повар горячего цеха"
    var name: String
    var gender: Gender
    var age: Int

    init(name: String, gender: Gender, age: Int) {
        self.name = name
        self.gender = gender
        self.age = age
    }

    func cook() {}
    func makeSoup() {}
    func fry() {}
}

class Waiter: Employee {
    var position = "официант"
    var name: String
    var gender: Gender
    var age: Int

    init(name: String, gender: Gender, age: Int) {
        self.name = name
        self.gender = gender
        self.age = age
    }

    func takeOrder(dish: Dish) {}
    func bringOrder(dish: Dish) {}
    func bringBill() {}
}

//Блюда в ресторане
enum Ingredient: String {
   case eggs = "яйцо"
   case tomatoes = "помидоры"
   case flour = "мука"
   case milk = "молоко"
   case fish = "рыба"
   case potatoes = "картофель"
   case sugar = "сахар"
   case cherry = "вишня"
}

class ScrambledEgg: Dish {
    var type: DishType
    var ingredients: [Ingredient]
    var cookTime: Int
    var price: Float

    init(type: DishType, ingredients: [Ingredient], cookTime: Int, price: Float) {
        self.type = type
        self.ingredients = ingredients
        self.cookTime = cookTime
        self.price = price
    }

    func prepareIngredients() {}
    func cookDish() {}
}

class Soup: Dish {
    var type: DishType
    var ingredients: [Ingredient]
    var cookTime: Int
    var price: Float

    init(type: DishType, ingredients: [Ingredient], cookTime: Int, price: Float) {
        self.type = type
        self.ingredients = ingredients
        self.cookTime = cookTime
        self.price = price
    }

    func prepareIngredients() {}
    func cookDish() {}
}

class Salad: Dish {
    var type: DishType
    var ingredients: [Ingredient]
    var cookTime: Int
    var price: Float

    init(type: DishType, ingredients: [Ingredient], cookTime: Int, price: Float) {
        self.type = type
        self.ingredients = ingredients
        self.cookTime = cookTime
        self.price = price
    }

    func prepareIngredients() {}
    func cookDish() {}
}


class FriedPotatoes: Dish {
    var type: DishType
    var ingredients: [Ingredient]
    var cookTime: Int
    var price: Float

    init(type: DishType, ingredients: [Ingredient], cookTime: Int,price: Float) {
        self.type = type
        self.ingredients = ingredients
        self.cookTime = cookTime
        self.price = price
    }

    func prepareIngredients() {}
    func cookDish() {}
}

class Cake: Dish {
    var type: DishType
    var ingredients: [Ingredient]
    var cookTime: Int
    var price: Float

    init(type: DishType, ingredients: [Ingredient], cookTime: Int, price: Float) {
        self.type = type
        self.ingredients = ingredients
        self.cookTime = cookTime
        self.price = price
    }

    func prepareIngredients() {}
    func cookDish() {}
}

// Заказ в ресторане
class NewOrder: Order {
    var takeOrderTime: Int
    var giveOrderTime: Int
    var dish: [Dish]
    var isCooked: Bool

    init(takeOrderTime: Int, giveOrderTime: Int, dish: [Dish], isCooked: Bool) {
        self.takeOrderTime = takeOrderTime
        self.giveOrderTime = giveOrderTime
        self.dish = dish
        self.isCooked = isCooked
    }

    func createOrder(dish: Dish) {}
    func checkStatus(dish: Dish) {}
    func getOrder(takeOrderTime: Int, giveOrderTime: Int) {}
    func complainAboutOrder() {}
}

// Хранилища продуктов
struct Foodstuff {
    var name: String
    var quantity: Int
}
var storehouseOfRestaurant: [Foodstuff] = []
var ordersOfRestaurant: [Order] = []

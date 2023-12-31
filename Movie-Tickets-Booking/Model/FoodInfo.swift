
import UIKit

struct FoodItems {
    let name: String
    let image: UIImage
    let price: Int
}
// 각 항목에 대한 배열
let comboItems: [FoodItems] = [
    FoodItems(name: "더블콤보", image: UIImage(named: "DoubleCombo")!, price: 13000),
    FoodItems(name: "커플콤보", image: UIImage(named: "CoupleCombo")!, price: 10000),
    FoodItems(name: "맥주콤보", image: UIImage(named: "BeerCombo")!, price: 18500),
    FoodItems(name: "즉석구이콤보", image: UIImage(named: "SquidCombo")!, price: 20000),
    FoodItems(name: "코카콜라베어콤보", image: UIImage(named: "CokeBearCombo")!, price: 15000)
]
let popcornItems: [FoodItems] = [
    FoodItems(name: "오리지널팝콘R", image: UIImage(named: "OriginalPopcornR")!, price: 5000),
    FoodItems(name: "오리지널팝콘L", image: UIImage(named: "OriginalPopcornL")!, price: 5500),
    FoodItems(name: "갈릭팝콘R", image: UIImage(named: "GarlicPopcornR")!, price: 6000),
    FoodItems(name: "갈릭팝콘L", image: UIImage(named: "GarlicPopcornL")!, price: 6500),
    FoodItems(name: "더블카라멜팝콘R", image: UIImage(named: "CaramelPopcornR")!, price: 7000),
    FoodItems(name: "더블카라멜팝콘L", image: UIImage(named: "CaramelPopcornL")!, price: 7500),
    FoodItems(name: "오리지널+갈릭팝콘L", image: UIImage(named: "Original+GarlicPopcornL")!, price: 6500),
    FoodItems(name: "오리지널+더블카라멜팝콘L", image: UIImage(named: "Caramel+OriginalPopcornL")!, price: 7500),
    FoodItems(name: "갈릭+더블카라멜팝콘L", image: UIImage(named: "Caramel+GarlicPopcornL")!, price: 7500)
]
let drinkItems: [FoodItems] = [
    FoodItems(name: "제휴음료R", image: UIImage(named: "BeverageR")!, price: 3000),
    FoodItems(name: "제휴음료L", image: UIImage(named: "BeverageL")!, price: 3500),
    FoodItems(name: "오렌지에이드", image: UIImage(named: "OrangeAde")!, price: 5500),
    FoodItems(name: "자몽에이드", image: UIImage(named: "GrapefruitAde")!, price: 5500),
    FoodItems(name: "아메리카노", image: UIImage(named: "HotAmericano")!, price: 5000),
    FoodItems(name: "아이스아메리카노", image: UIImage(named: "IceAmericano")!, price: 5500),
    FoodItems(name: "순수(생수)페트", image: UIImage(named: "PureBottleWater")!, price: 2000)
]
let snackItems: [FoodItems] = [
    FoodItems(name: "오리지널핫도그", image: UIImage(named: "OriginalHotdog")!, price: 5500),
    FoodItems(name: "살사핫도그", image: UIImage(named: "SalsaHotdog")!, price: 7500),
    FoodItems(name: "즉석구이(몸통)", image: UIImage(named: "Squid(Body)")!, price: 6500),
    FoodItems(name: "즉석구이(몸+다리)", image: UIImage(named: "Squid(Whole)")!, price: 10000),
    FoodItems(name: "칠리치즈나쵸", image: UIImage(named: "ChillCheeseNachos")!, price: 5500)
]
let goodiesItems: [FoodItems] = [
    FoodItems(name: "3D짱구피규어셋트", image: UIImage(named: "3DShinchanFigureSet")!, price: 23000),
    FoodItems(name: "꾸래핑음료컵", image: UIImage(named: "OkeydokeypingCup")!, price: 19500),
    FoodItems(name: "하츄핑음료컵", image: UIImage(named: "HeartspingCup")!, price: 19500),
    FoodItems(name: "마이크 와조스키 팝콘버켓", image: UIImage(named: "MikeWazowskiBucket")!, price: 32000)
]

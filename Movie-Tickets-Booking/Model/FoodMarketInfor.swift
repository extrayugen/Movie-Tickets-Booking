//
//  FoodMarketInfor.swift
//  Movie-Tickets-Booking
//
//  Created by t2023-m0028 on 12/28/23.
//

import UIKit
struct Fooditems{
    let name : String
    let image : UIImage
    let price : String?
}
let comboItems: [Fooditems] = [
    Fooditems(name: "더블콤보", image: UIImage(named: "DoubleCombo")!, price: "13,000원"),
    Fooditems(name: "커플콤보", image: UIImage(named: "CoupleCombo")!, price: "10,000원"),
    Fooditems(name: "맥주콤보", image: UIImage(named: "BeerCombo")!, price: "18,500원"),
    Fooditems(name: "즉석구이콤보", image: UIImage(named: "SquidCombo")!, price: "20,000원"),
    Fooditems(name: "코카콜라베어콤보", image: UIImage(named: "CokeBearCombo")!, price: "15,000원")
]
let popcornItems: [Fooditems] = [
    Fooditems(name: "오리지널팝콘R", image: UIImage(named: "OriginalPopcornR")!, price: "5,000원"),
    Fooditems(name: "오리지널팝콘L", image: UIImage(named: "OriginalPopcornL")!, price: "5,500원"),
    Fooditems(name: "갈릭팝콘R", image: UIImage(named: "GarlicPopcornR")!, price: "6,000원"),
    Fooditems(name: "갈릭팝콘L", image: UIImage(named: "GarlicPopcornL")!, price: "6,500원"),
    Fooditems(name: "더블카라멜팝콘R", image: UIImage(named: "CaramelPopcornR")!, price: "7,000원"),
    Fooditems(name: "더블카라멜팝콘L", image: UIImage(named: "CaramelPopcornL")!, price: "7,500원"),
    Fooditems(name: "오리지널+갈릭팝콘L", image: UIImage(named: "Origial+GarlicPopcornL")!, price: "6,500원"),
    Fooditems(name: "오리지널+더블카라멜팝콘L", image: UIImage(named: "Popcorn/Caramel+OrigialPopcornL")!, price: "7,500원"),
    Fooditems(name: "갈릭+더블카라멜팝콘L", image: UIImage(named: "Caramel+GarlicPopcornL")!, price: "7,500원")
]

let drinkItems: [Fooditems] = [
    Fooditems(name: "제휴음료R", image: UIImage(named: "BeverageR")!, price: "3,000원"),
    Fooditems(name: "제휴음료L", image: UIImage(named: "BeverageL")!, price: "3,500원"),
    Fooditems(name: "오렌지에이드", image: UIImage(named: "OrangeAde")!, price: "5,500원"),
    Fooditems(name: "자몽에이드", image: UIImage(named: "GrapefruitAde")!, price: "5,500원"),
    Fooditems(name: "아메리카노", image: UIImage(named: "HotAmericano")!, price: "5,000원"),
    Fooditems(name: "아이스아메리카노", image: UIImage(named: "IceAmericano")!, price: "5,500원"),
    Fooditems(name: "순수(생수)페트", image: UIImage(named: "PureBottleWater")!, price: "2,000원")
]

let snackItems: [Fooditems] = [
    Fooditems(name: "오리지널핫도그", image: UIImage(named: "OriginalHotdog")!, price: "5,500원"),
    Fooditems(name: "살사핫도그", image: UIImage(named: "SalsaHotdog")!, price: "7,500원"),
    Fooditems(name: "즉석구이(몸통)", image: UIImage(named: "Squid(body)")!, price: "6,500원"),
    Fooditems(name: "즉석구이(몸+다리)", image: UIImage(named: "Squid(Whole)")!, price: "10,000원"),
    Fooditems(name: "칠리치즈나쵸", image: UIImage(named: "ChillCheeseNachos")!, price: "5,500원")
]

let goodiesItems: [Fooditems] = [
    Fooditems(name: "3D짱구피규어셋트", image: UIImage(named: "3DShinchanFigureSet")!, price: "23,000원"),
    Fooditems(name: "꾸래핑음료컵", image: UIImage(named: "OkeydokeypingCup")!, price: "19,500원"),
    Fooditems(name: "하츄핑음료컵", image: UIImage(named: "HeartspingCup")!, price: "19,500원"),
    Fooditems(name: "마이크와조스키팝콘버켓", image: UIImage(named: "MikeWazowskiBucket")!, price: "32,000원")
]


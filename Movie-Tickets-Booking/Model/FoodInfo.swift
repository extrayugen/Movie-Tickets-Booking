//
//  FoodMarketInfor.swift
//  Movie-Tickets-Booking
//
//  Created by t2023-m0028 on 12/28/23.
//
import UIKit
class foodCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var priceInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        func setup(image:UIImage, name: String, price: String){
            foodImage.image = image
            productName.text = name
            priceInfo.text = price
        }
        
    }
    
    
    struct FoodItems{
        let name : String
        let image : UIImage
        let price : String
    }
    let comboItems: [FoodItems] = [
        FoodItems(name: "더블콤보", image: UIImage(named: "Combo/DoubleCombo")!, price: "13,000원"),
        FoodItems(name: "커플콤보", image: UIImage(named: "Combo/CoupleCombo")!, price: "10,000원"),
        FoodItems(name: "맥주콤보", image: UIImage(named: "Combo/BeerCombo")!, price: "18,500원"),
        FoodItems(name: "즉석구이콤보", image: UIImage(named: "Combo/SquidCombo")!, price: "20,000원"),
        FoodItems(name: "코카콜라베어콤보", image: UIImage(named: "Combo/CokeBearCombo")!, price: "15,000원")
    ]
    let popcornItems: [FoodItems] = [
        FoodItems(name: "오리지널팝콘R", image: UIImage(named: "Popcorn/OriginalPopcornR")!, price: "5,000원"),
        FoodItems(name: "오리지널팝콘L", image: UIImage(named: "Popcorn/OriginalPopcornL")!, price: "5,500원"),
        FoodItems(name: "갈릭팝콘R", image: UIImage(named: "Popcorn/GarlicPopcornR")!, price: "6,000원"),
        FoodItems(name: "갈릭팝콘L", image: UIImage(named: "Popcorn/GarlicPopcornL")!, price: "6,500원"),
        FoodItems(name: "더블카라멜팝콘R", image: UIImage(named: "Popcorn/CaramelPopcornR")!, price: "7,000원"),
        FoodItems(name: "더블카라멜팝콘L", image: UIImage(named: "Popcorn/CaramelPopcornL")!, price: "7,500원"),
        FoodItems(name: "오리지널+갈릭팝콘L", image: UIImage(named: "Popcorn/Origial+GarlicPopcornL")!, price: "6,500원"),
        FoodItems(name: "오리지널+더블카라멜팝콘L", image: UIImage(named: "Popcorn/Caramel+OrigialPopcornL")!, price: "7,500원"),
        FoodItems(name: "갈릭+더블카라멜팝콘L", image: UIImage(named: "Popcorn/Caramel+GarlicPopcornL")!, price: "7,500원")
    ]
    
    let drinkItems: [FoodItems] = [
        FoodItems(name: "제휴음료R", image: UIImage(named: "Drinks/BeverageR")!, price: "3,000원"),
        FoodItems(name: "제휴음료L", image: UIImage(named: "Drinks/BeverageL")!, price: "3,500원"),
        FoodItems(name: "오렌지에이드", image: UIImage(named: "Drinks/OrangeAde")!, price: "5,500원"),
        FoodItems(name: "자몽에이드", image: UIImage(named: "Drinks/GrapefruitAde")!, price: "5,500원"),
        FoodItems(name: "아메리카노", image: UIImage(named: "Drinks/HotAmericano")!, price: "5,000원"),
        FoodItems(name: "아이스아메리카노", image: UIImage(named: "Drinks/IceAmericano")!, price: "5,500원"),
        FoodItems(name: "순수(생수)페트", image: UIImage(named: "Drinks/PureBottleWater")!, price: "2,000원")
    ]
    
    let snackItems: [FoodItems] = [
        FoodItems(name: "오리지널핫도그", image: UIImage(named: "Snacks/OriginalHotdog")!, price: "5,500원"),
        FoodItems(name: "살사핫도그", image: UIImage(named: "Snacks/SalsaHotdog")!, price: "7,500원"),
        FoodItems(name: "즉석구이(몸통)", image: UIImage(named: "Snacks/Squid(body)")!, price: "6,500원"),
        FoodItems(name: "즉석구이(몸+다리)", image: UIImage(named: "Snacks/Squid(Whole)")!, price: "10,000원"),
        FoodItems(name: "칠리치즈나쵸", image: UIImage(named: "Snacks/ChillCheeseNachos")!, price: "5,500원")
    ]
    
    let goodiesItems: [FoodItems] = [
        FoodItems(name: "3D짱구피규어셋트", image: UIImage(named: "Goodies/3DShinchanFigureSet")!, price: "23,000원"),
        FoodItems(name: "꾸래핑음료컵", image: UIImage(named: "Goodies/OkeydokeypingCup")!, price: "19,500원"),
        FoodItems(name: "하츄핑음료컵", image: UIImage(named: "Goodies/HeartspingCup")!, price: "19,500원"),
        FoodItems(name: "마이크와조스키팝콘버켓", image: UIImage(named: "Goodies/MikeWazowskiBucket")!, price: "32,000원")
    ]
    
}

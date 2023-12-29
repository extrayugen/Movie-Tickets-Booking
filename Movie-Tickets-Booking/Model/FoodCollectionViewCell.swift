

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
    
    func setup(with food: foodItems){
        foodImage.image = food.image
        foodName.text = food.name
        foodPrice.text = "\(food.price)원"
    }
}





import UIKit

class FoodCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodName: UILabel!
    @IBOutlet weak var foodPrice: UILabel!
   
    var delegate: FoodCellDelegate?
       var foodItem: FoodItems?

       func setup(with food: FoodItems) {
           foodItem = food
           foodImage.image = food.image
           foodName.text = food.name
           let formatter = NumberFormatter()
           formatter.numberStyle = .decimal
           if let foodPriceString = formatter.string(from: NSNumber(value: food.price)) {
               foodPrice.text = "\(foodPriceString)원"
           }
       }

       override func awakeFromNib() {
           super.awakeFromNib()
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
           self.addGestureRecognizer(tapGesture)
       }

       @objc func cellTapped() {
           if let food = foodItem {
               delegate?.foodCellDidTap(food: food)
           }
       }
   }

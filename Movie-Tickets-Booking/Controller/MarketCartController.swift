import UIKit

class MarketCartService {
    static let shared = MarketCartService()
    var selectedFoodItems: [FoodItems] = []
    
    // 장바구니에 음식 추가
    func addToCart(food: FoodItems) {
        selectedFoodItems.append(food)
        print("Added to cart: \(food.name)")
    }
    
    //총 금액 계산
    func marCartTotalPrice() -> Int {
        return selectedFoodItems.reduce(0) { $0 + $1.price }
    }
}
class MarketCartController: UIViewController {
    
    @IBOutlet weak var marketInfoTableView: UITableView!
    @IBOutlet weak var marketTotalPriceLabel: UILabel!

    
    let marketCartService = MarketCartService.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        marketInfoTableView.delegate = self
        marketInfoTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        marketInfoTableView.reloadData()
        marketTotalPriceLabel.text = "\(marketCartService.marCartTotalPrice())원"
    }
    
    //결제하기 버튼
    @IBAction func paymentTapped(_ sender: Any) {
        //결제 동작 구현
    }
    
    
}

extension MarketCartController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marketCartService.selectedFoodItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as! FoodCell
        let foodItem = marketCartService.selectedFoodItems[indexPath.row]
        
        cell.foodImageView.image = foodItem.image
        cell.foodNameLabel.text = foodItem.name
        cell.foodPriceLabel.text = "\(foodItem.price)원"
        
        return cell
    }

    //셀 높이
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
}

class FoodCell: UITableViewCell {
    
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    
}

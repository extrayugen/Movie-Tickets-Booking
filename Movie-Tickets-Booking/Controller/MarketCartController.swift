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
    
    // 장바구니에 있는 항목 출력 후 비우기
    func printSelectedItems() {
        if !selectedFoodItems.isEmpty {
            print("===== 영수증 =====")
            //추가된 항목 반복문으로 프린트
            for food in selectedFoodItems {
                print("\(food.name) : \(food.price)원")
            }
            //총 금액 표시
            let totalPrice = selectedFoodItems.reduce(0) { $0 + $1.price }
            print("-----------------")
            print("총합: \(totalPrice)원")
            print("=================")
            
            // 장바구니 비우기.
            selectedFoodItems.removeAll()
        }

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
        
        let totalAmount = marketCartService.marCartTotalPrice()
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        if let totalAmountString = formatter.string(from: NSNumber(value: totalAmount)) {
            marketTotalPriceLabel.text = "\(totalAmountString)원"
        }
        
    }
    
    
    
    
    //결제하기 버튼
    @IBAction func paymentTapped(_ sender: Any) {
        //결제 동작 구현
        let alert = UIAlertController(title: nil, message: "결제를 하시겠습니까?", preferredStyle: .actionSheet)
        
        let okAction = UIAlertAction(title: "확인", style: .default) { [weak self] _ in
            self?.marketCartService.printSelectedItems()
            self?.navigationController?.popToRootViewController(animated: true) // 메인 화면으로 돌아가기
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
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
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if let price = formatter.string(from: NSNumber(value: foodItem.price)) {
            cell.foodPriceLabel.text = "\(price)원"
        }
        
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

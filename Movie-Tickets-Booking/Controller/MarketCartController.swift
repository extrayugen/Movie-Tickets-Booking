import Foundation
import UIKit


class MarketCartController: UIViewController {
    
    @IBOutlet weak var marketInfoTableView: UITableView!
    @IBOutlet weak var selectedMarketCollection: UICollectionView!
    @IBOutlet weak var marketTotalPriceLabel: UILabel!
    
    
    //마켓에서 사용자가 선택한 간식 정보 저장.
    var selectedItems: [Fooditems] = [
        Fooditems(name: "즉석구이(몸+다리)", image: UIImage(named: "Snacks/Squid(Whole)")!, price: "10,000원")
    ]
    
    //이미지 배열
    var images: [UIImage] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedMarketCollection.backgroundColor = .green

        updateTotalPriceLabel()
        updateImages()
    }
    
    //총 금액 업데이트
    // 총 금액 업데이트
    func updateTotalPriceLabel() {
        let totalPrice = selectedItems.reduce(0) { (result, item) -> Int in
            let priceValue = (item.price?.replacingOccurrences(of: "원", with: "")).flatMap { Int($0) } ?? 0
            return result + priceValue
        }
        marketTotalPriceLabel.text = "\(totalPrice)원"
    }
    
    //이미지 배열 업데이트
    func updateImages() {
        for item in selectedItems {
            images.append(item.image)
        }
    }
    //결제하기 버튼
    @IBAction func paymentTapped(_ sender: Any) {
        //결제 동작 구현
    }
}


extension MarketCartController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //테이블 뷰
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = marketInfoTableView.dequeueReusableCell(withIdentifier: "marketCell", for: indexPath)
        cell.textLabel?.text = selectedItems[indexPath.row].name
        return cell
    }
    
    
    //콜렉션 뷰
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let imageView = cell.contentView.subviews.first as? UIImageView {
            imageView.image = images[indexPath.row]
        }
        return cell
    }
    
    
}

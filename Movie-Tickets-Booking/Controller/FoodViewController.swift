//
//  FoodMarketViewController.swift
//  Movie-Tickets-Booking
//
//  Created by t2023-m0028 on 12/28/23.
//
import UIKit

protocol FoodCellDelegate: AnyObject {
    func foodCellDidTap(food: foodItems)
}

class FoodViewController: UIViewController {
    @IBOutlet weak var foodSegmentControl: UISegmentedControl!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    override func viewDidLoad() {
         super.viewDidLoad()
         foodCollectionView.dataSource = self
        foodCollectionView.delegate = self
        foodCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
     }
 }
extension FoodViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comboItems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = foodCollectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionViewCell", for: indexPath) as! FoodCollectionViewCell
        cell.delegate = self  // 셀의 델리게이트를 설정
        cell.setup(with: comboItems[indexPath.row])
        return cell
    }
}

extension FoodViewController: UICollectionViewDelegateFlowLayout, FoodCellDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 220)
    }

    func foodCellDidTap(food: foodItems) {
        let alertController = UIAlertController(title: "장바구니에 추가", message: "장바구니에 \(food.name)을(를) 추가하시겠습니까?", preferredStyle: .alert)

        let addAction = UIAlertAction(title: "추가", style: .default) { _ in
            // 여기에 장바구니에 추가하는 로직을 추가하세요.
            // 예시: ShoppingCartController에 메서드를 구현하고 호출
            // ShoppingCartController.addToCart(food: food)
        }

        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        alertController.addAction(addAction)
        alertController.addAction(cancelAction)

        present(alertController, animated: true, completion: nil)
    }
}

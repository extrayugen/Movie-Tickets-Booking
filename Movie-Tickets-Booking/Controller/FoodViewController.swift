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
    
    var currentItems: [foodItems] = comboItems // 초기값으로 콤보 아이템 설정

        override func viewDidLoad() {
            super.viewDidLoad()
            foodCollectionView.dataSource = self
            foodCollectionView.delegate = self
            foodCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
            
            // 세그먼트 값이 변경될 때 호출되는 메서드 등록
            foodSegmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        }

        @objc func segmentChanged() {
            // 세그먼트에 따라 현재 아이템을 업데이트하고 컬렉션 뷰 리로드
            switch foodSegmentControl.selectedSegmentIndex {
            case 0:
                currentItems = comboItems
            case 1:
                currentItems = popcornItems
            case 2:
                currentItems = drinkItems
            case 3:
                currentItems = snackItems
            case 4:
                currentItems = goodiesItems
            default:
                break
            }
            foodCollectionView.reloadData()
        }
    }

    extension FoodViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return currentItems.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = foodCollectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionViewCell", for: indexPath) as! FoodCollectionViewCell
            cell.delegate = self
            cell.setup(with: currentItems[indexPath.row])
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

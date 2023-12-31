//
//  FoodMarketViewController.swift
//  Movie-Tickets-Booking
//
//  Created by t2023-m0028 on 12/28/23.
//
import UIKit

protocol FoodCellDelegate: AnyObject {
    func foodCellDidTap(food: FoodItems)
}

class FoodViewController: UIViewController {
    
    @IBOutlet weak var foodSegmentControl: UISegmentedControl!
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        return label
    }()
    
    var currentItems: [FoodItems] = comboItems // 초기값으로 콤보 아이템 설정
    
    override func viewDidLoad() {
        super.viewDidLoad()
        foodCollectionView.dataSource = self
        foodCollectionView.delegate = self
        foodCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        // 세그먼트 값이 변경될 때 호출되는 메서드 등록
        foodSegmentControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        
        // 메시지 레이블을 뷰에 추가
        view.addSubview(messageLabel)
        
        // Auto Layout 설정
        NSLayoutConstraint.activate([
            messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            messageLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            messageLabel.heightAnchor.constraint(equalToConstant: 40) // 높이 조절 가능
        ])
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
    
    func showAddToCartMessage(for food: FoodItems) {
        messageLabel.text = "장바구니에 \(food.name)가 추가되었습니다."
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.messageLabel.text = ""
        }
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

extension FoodViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = 10 * 3
        let availableWidth = collectionView.frame.width - CGFloat(paddingSpace)
        let widthPerItem = availableWidth / 2
        return CGSize(width: widthPerItem, height: 220)
    }
}

extension FoodViewController: FoodCellDelegate {
    func foodCellDidTap(food: FoodItems) {
        let alertController = UIAlertController(title: "장바구니에 추가", message: "장바구니에 \(food.name)을(를) 추가하시겠습니까?", preferredStyle: .alert)
        
        let addAction: UIAlertAction = UIAlertAction(title: "추가", style: .default) { _ in
            // MarketCartControlle에 있는 배열에 전달.
            MarketCartService.shared.selectedFoodItems.append(food)
            
            self.showAddToCartMessage(for: food)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
}

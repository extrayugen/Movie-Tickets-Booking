//
//  FoodMarketViewController.swift
//  Movie-Tickets-Booking
//
//  Created by t2023-m0028 on 12/28/23.
//
import UIKit

class FoodViewController: UIViewController {

    @IBOutlet var foodSegmentControl: UISegmentedControl!
    @IBOutlet var foodCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FoodViewController - viewDidLoad() called")
       
        foodCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        foodCollectionView.dataSource = self
              foodCollectionView.delegate = self
    }
    @IBAction func onFoodMenuTypeChanged(_ sender: UISegmentedControl) {
        print("FoodViewController - onFoodMenuTypeChanged() called / sender.selectedSegmentIndex : \(sender.selectedSegmentIndex)")
    }
    
}

//데이터 소스 설정 - 데이터와 관련된 것들
extension FoodViewController : UICollectionViewDataSource {
    
    //각 섹션에 들어가는 아이템 갯수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comboItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionViewCell", for: indexPath) as! FoodCollectionViewCell
        cell.setup(with: comboItems[indexPath.row])
        return cell
    }
    
}

extension FoodViewController : UICollectionViewDelegate {
    
}

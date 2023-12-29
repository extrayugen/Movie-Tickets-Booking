//
//  FoodMarketViewController.swift
//  Movie-Tickets-Booking
//
//  Created by t2023-m0028 on 12/28/23.
//
import UIKit

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

 extension FoodViewController: UICollectionViewDataSource{
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return comboItems.count
     }
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell=foodCollectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionViewCell", for: indexPath)as! FoodCollectionViewCell
         cell.setup(with: comboItems[indexPath.row])
         return cell
     }
 }

extension FoodViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 220)
    }
}

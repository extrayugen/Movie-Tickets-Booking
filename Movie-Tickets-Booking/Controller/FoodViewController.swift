//
//  FoodMarketViewController.swift
//  Movie-Tickets-Booking
//
//  Created by t2023-m0028 on 12/28/23.
//
import UIKit

class FoodViewController: UIViewController {
    @IBOutlet weak var foodCollectionView: UICollectionView!
    
    override func viewDidLoad() {
         super.viewDidLoad()
         foodCollectionView.dataSource = self
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

//
//  FoodMarketViewController.swift
//  Movie-Tickets-Booking
//
//  Created by t2023-m0028 on 12/28/23.
//
import UIKit

class FoodViewController: UIViewController {
    @IBOutlet var foodCollectionView: UICollectionView!
   
        override func viewDidLoad() {
            super.viewDidLoad()
            print("foodViewController - viewDidLoad() called")
            foodCollectionView.register(FoodCollectionViewCell.nib(), forCellWithReuseIdentifier: "FoodCollectionViewCell")
            foodCollectionView.delegate = self
            foodCollectionView.dataSource = self
        }
    }

    extension FoodViewController: UICollectionViewDataSource {
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 12
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FoodCollectionViewCell", for: indexPath) as! FoodCollectionViewCell
            cell.configure(with: UIImage(named: "DoubleCombo")!)
            return cell
        }
    }

    extension FoodViewController: UICollectionViewDelegate {
        func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            collectionView.deselectItem(at: indexPath, animated: true)
            print("You tapped me")
        }
    }

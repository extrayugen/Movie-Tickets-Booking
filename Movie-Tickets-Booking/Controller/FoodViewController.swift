//
//  FoodMarketViewController.swift
//  Movie-Tickets-Booking
//
//  Created by t2023-m0028 on 12/28/23.
//
import UIKit

class FoodViewController: UIViewController {
    @IBOutlet var foodCollectionView: UICollectionView!
    @IBOutlet weak var foodSegmentControl: UISegmentedControl!
    
    // 현재 선택된 항목에 대한 배열
           var selectedItems: [Fooditems] {
               switch foodSegmentControl.selectedSegmentIndex {
               case 0: return comboItems
               case 1: return popcornItems
               case 2: return drinkItems
               case 3: return snackItems
               case 4: return goodiesItems
               default: return []
               }
           }

           override func viewDidLoad() {
               super.viewDidLoad()
               setupSegmentedControl()
               setupCollectionView()
           }

           func setupSegmentedControl() {
               foodSegmentControl.addTarget(self, action: #selector(segmentControlValueChanged(_:)), for: .valueChanged)
           }

           func setupCollectionView() {
               foodCollectionView.dataSource = self
               foodCollectionView.delegate = self
               foodCollectionView.register(foodCollectionViewCell.self, forCellWithReuseIdentifier: "foodCollectionViewCell")
           }

           @objc func segmentControlValueChanged(_ sender: UISegmentedControl) {
               foodCollectionView.reloadData()
           }
       }

       extension FoodViewController: UICollectionViewDataSource {
           func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
               return selectedItems.count
           }

           func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
               let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foodCollectionViewCell", for: indexPath) as! foodCollectionViewCell
               let item = selectedItems[indexPath.item]

               // FoodCollectionViewCell에 데이터 설정
               cell.setup(with: item)

               return cell
           }
       }

       extension FoodViewController: UICollectionViewDelegate {
           func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
               let selectedItem = selectedItems[indexPath.item]
               // 선택된 항목에 대한 추가 동작 수행
               print("선택된 항목: \(selectedItem.name)")
           }
       }

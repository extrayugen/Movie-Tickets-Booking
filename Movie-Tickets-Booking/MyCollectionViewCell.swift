//
//  MyCollectionViewCell.swift
//  Movie-Tickets-Booking
//
//  Created by t2023-m0028 on 12/27/23.
//

import Foundation
import UIKit
class MyCollectionViewCell: UICollectionViewCell {
class FoodMarketViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

        @IBOutlet weak var segmentedControl: UISegmentedControl!
        @IBOutlet weak var collectionView: UICollectionView!

        var dataForCombo: [YourImageDataModel] = []
        var dataForPopcorn: [YourImageDataModel] = []
        var dataForBeverage: [YourImageDataModel] = []
        var dataForSnack: [YourImageDataModel] = []
        var dataForGoods: [YourImageDataModel] = []

        override func viewDidLoad() {
            super.viewDidLoad()

            // 세그먼트 컨트롤의 액션 설정
            segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)

            // 초기 데이터 로드 및 표시
            loadDataForCombo()
            collectionView.reloadData()
        }

        @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
            // 세그먼트가 변경되었을 때 호출되는 메서드
            switch sender.selectedSegmentIndex {
            case 0:
                loadDataForCombo()
            case 1:
                loadDataForPopcorn()
            case 2:
                loadDataForBeverage()
            case 3:
                loadDataForSnack()
            case 4:
                loadDataForGoods()
            default:
                break
            }

            collectionView.reloadData()
        }

        func loadDataForCombo() {
            // "콤보"에 해당하는 폴더에서 이미지를 가져와 데이터 모델 생성
            dataForCombo = loadImagesFromFolder(named: "콤보")
        }

        func loadDataForPopcorn() {
            // "팝콘"에 해당하는 폴더에서 이미지를 가져와 데이터 모델 생성
            dataForPopcorn = loadImagesFromFolder(named: "팝콘")
        }

        func loadDataForBeverage() {
            // "음료"에 해당하는 폴더에서 이미지를 가져와 데이터 모델 생성
            dataForBeverage = loadImagesFromFolder(named: "음료")
        }

        func loadDataForSnack() {
            // "스낵"에 해당하는 폴더에서 이미지를 가져와 데이터 모델 생성
            dataForSnack = loadImagesFromFolder(named: "스낵")
        }

        func loadDataForGoods() {
            // "굿즈"에 해당하는 폴더에서 이미지를 가져와 데이터 모델 생성
            dataForGoods = loadImagesFromFolder(named: "굿즈")
        }

        func loadImagesFromFolder(named folderName: String) -> [YourImageDataModel] {
            var images: [YourImageDataModel] = []

            guard let folderURL = Bundle.main.url(forResource: folderName, withExtension: nil) else {
                // 폴더 경로를 찾을 수 없을 경우
                return images
            }

            do {
                let fileURLs = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil)

                // 이미지 파일들을 순회하면서 데이터 모델에 추가
                for fileURL in fileURLs {
                    let imageName = fileURL.lastPathComponent
                    let imageData = YourImageDataModel(imageName: imageName, title: "YourTitle") // YourImageDataModel은 여러분이 사용하는 데이터 모델에 맞게 수정

                    images.append(imageData)
                }
            } catch {
                print("Error while enumerating files in \(folderName): \(error.localizedDescription)")
            }

            return images
        }

        // MARK: - UICollectionViewDataSource

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            // 컬렉션뷰 셀 개수 반환
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                return dataForCombo.count
            case 1:
                return dataForPopcorn.count
            case 2:
                return dataForBeverage.count
            case 3:
                return dataForSnack.count
            case 4:
                return dataForGoods.count
            default:
                return 0
            }
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            // 컬렉션뷰 셀 반환
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! YourCollectionViewCell

            // 데이터를 가져와서 셀에 할당
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                let data = dataForCombo[indexPath.item]
                cell.imageView.image = UIImage(named: data.imageName)
                cell.titleLabel.text = data.title
            case 1:
                let data = dataForPopcorn[indexPath.item]
                cell.imageView.image = UIImage(named: data.imageName)
                cell.titleLabel.text = data.title
            case 2:
                let data = dataForBeverage[indexPath.item]
                cell.imageView.image = UIImage(named: data.imageName)
                cell.titleLabel.text = data.title
            case 3:
                let data = dataForSnack[indexPath.item]
                cell.imageView.image = UIImage(named: data.imageName)
                cell.titleLabel.text = data.title
            case 4:
                let data = dataForGoods[indexPath.item]
                cell.imageView.image = UIImage(named: data.imageName)
                cell.titleLabel.text = data.title
            default:
                fatalError("Invalid segment index")
            }

            return cell
        }
    }

}


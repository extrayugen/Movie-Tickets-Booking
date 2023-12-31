//
//  CustomTableViewCell.swift
//  Movie-Tickets-Booking
//
//  Created by t2023-m0051 on 12/29/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView : UIImageView!
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var timeButton01 : UIButton!
    @IBOutlet weak var timeButton02 : UIButton!
    @IBOutlet weak var timeButton03 : UIButton!

    override func awakeFromNib() {
         super.awakeFromNib()

         // 이미지 뷰 스타일 설정
        iconImageView.layer.cornerRadius = 0

         // 레이블 스타일 설정
         title.font = UIFont.systemFont(ofSize: 17, weight: .bold)
         title.textColor = .darkGray

         // 버튼 스타일 설정
         let buttons = [timeButton01, timeButton02, timeButton03]
         buttons.forEach { button in
             button?.layer.cornerRadius = 5
             button?.backgroundColor = .lightGray
         }
     }
 }

//
//  FoodCollectionViewCell.swift
//  Movie-Tickets-Booking
//
//  Created by t2023-m0028 on 12/29/23.
//

import UIKit

class FoodCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    public func configure(with Image: UIImage){
        imageView.image = Image
    }
    static func nib() ->UINib {
        return UINib(nibName: "FoodCollectionViewCell", bundle: nil)
    }
}

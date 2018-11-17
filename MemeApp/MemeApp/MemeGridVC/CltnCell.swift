//
//  CltnCell.swift
//  MemeApp
//
//  Created by vasu on 17/11/18.
//  Copyright © 2018 Vasu. All rights reserved.
//

import UIKit

class CltnCell: UICollectionViewCell {
    

    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mDescLbl: UILabel!
    @IBOutlet weak var mBackgroundView:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mBackgroundView.layer.cornerRadius = 4.0
        mBackgroundView.clipsToBounds = true
        // Initialization code
    }
    
    func set(image :UIImage , memeTopText :String, memeBottomText: String)  {
        
        //mImage.image = UIImage(named: "Cameraicon")
        mImage.image = image
        mDescLbl.text  = memeTopText + memeBottomText
    }


}

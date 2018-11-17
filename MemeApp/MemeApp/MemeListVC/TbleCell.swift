//
//  TbleCell.swift
//  MemeApp
//
//  Created by vasu on 05/11/18.
//  Copyright © 2018 Vasu. All rights reserved.
//

import UIKit

class TbleCell: UITableViewCell {

    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mTitle :UILabel!
    @IBOutlet weak var mBackgroundView:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mBackgroundView.layer.cornerRadius = 4.0
        mBackgroundView.clipsToBounds = true

    }
    
    func set(image :UIImage , memeTopText :String, memeBottomText: String)  {
       
        //mImage.image = UIImage(named: "Cameraicon")
        mImage.image = image
        mTitle.text  = memeTopText + memeBottomText
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

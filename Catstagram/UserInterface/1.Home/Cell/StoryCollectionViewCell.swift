//
//  StoryCollectionViewCell.swift
//  Catstagram
//
//  Created by 노영재 on 2022/02/10.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var viewBigBackground: UIView!
    @IBOutlet weak var viewSmallBackground: UIView!
    @IBOutlet weak var imageViewStoryUser: UIImageView!
    @IBOutlet weak var viewContent: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewBigBackground.layer.cornerRadius = 20
        viewSmallBackground.layer.cornerRadius = 19.5
        imageViewStoryUser.layer.cornerRadius = 18.5
    }

}

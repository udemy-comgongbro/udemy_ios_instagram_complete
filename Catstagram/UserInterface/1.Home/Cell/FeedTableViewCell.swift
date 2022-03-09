//
//  FeedTableViewCell.swift
//  Catstagram
//
//  Created by 노영재 on 2022/02/10.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    @IBOutlet weak var imageViewFeedUser: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var imageViewFeed: UIImageView!
    @IBOutlet weak var buttonIsHeart: UIButton!
    @IBOutlet weak var labelHowMany: UILabel!
    @IBOutlet weak var labelFeed: UILabel!
    @IBOutlet weak var buttonBookMark: UIButton!
    @IBOutlet weak var imageViewUser: UIImageView!
    
    @IBAction func buttonDoBookMark(_ sender: Any) {
        if buttonBookMark.isSelected {
            buttonBookMark.isSelected = false
        } else {
            buttonBookMark.isSelected = true
        }
    }
    @IBAction func buttonDoHeart(_ sender: Any) {
        if buttonIsHeart.isSelected {
            buttonIsHeart.isSelected = false
        } else {
            buttonIsHeart.isSelected = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageViewFeedUser.layer.cornerRadius = 20
        imageViewUser.layer.cornerRadius = 15
        
        let fontSize = UIFont.boldSystemFont(ofSize: 13)
        
        let attributedStr = NSMutableAttributedString(string: labelFeed.text ?? "")
        attributedStr.addAttribute(.font, value: fontSize, range: NSRange.init(location: 0, length: 4))
        
        labelFeed.attributedText = attributedStr
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

//
//  PopUpCardTableViewCell.swift
//  PopUpCards
//
//  Created by Mark Rufino on 01/05/2018.
//  Copyright © 2018 Mark Rufino. All rights reserved.
//

import UIKit

class PopUpCardTableViewCell: UITableViewCell {
    
    static let identifier = "PopUpCardTableViewCell"

    @IBOutlet weak var popUpCardView: PopUpCardView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        popUpCardView.clipsToBounds = true
        popUpCardView.bannerHeight = CGFloat.popUpCardViewHeight
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

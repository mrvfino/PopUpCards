//
//  PopUpCardView.swift
//  PopUpCards
//
//  Created by Mark Rufino on 01/05/2018.
//  Copyright © 2018 Mark Rufino. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class PopUpCardView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var title: String {
        set {
            titleLabel.text = newValue
        }
        get {
            return titleLabel.text!
        }
    }
    
    @IBOutlet weak var bannerConstraint: NSLayoutConstraint!
    
    var bannerHeight: CGFloat {
        set {
            bannerConstraint.constant = newValue
        }
        get {
            return bannerConstraint.constant
        }
    }
    
    override init(frame: CGRect) { // for using CustomView in code
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { // for using CustomView in IB
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit() {
        let view = viewFromNibForClass()
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.addSubview(view)
        additionalSetup()
    }
    
    private func additionalSetup() {
    }
    
    private func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "PopUpCardView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
}

//
//  ViewController.swift
//  PopUpCards
//
//  Created by Mark Rufino on 01/05/2018.
//  Copyright © 2018 Mark Rufino. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var popUpCardTableView: UITableView!
    
    let dummyTableViewData: [String] = ["1st Item", "2nd Item", "3rd Item"]
    
    var storedFrame: CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initPopUpCardTableView()
    }

    func initPopUpCardTableView() {
        popUpCardTableView.separatorStyle = .none
        popUpCardTableView.dataSource = self
        popUpCardTableView.delegate = self
        
        let nib = UINib(nibName: "PopUpCardTableViewCell", bundle: nil)
        popUpCardTableView.register(nib, forCellReuseIdentifier: PopUpCardTableViewCell.identifier)
    }
    
    @objc func dummyViewTapGestureHandler(_ sender: UIGestureRecognizer) {
        
        let viewToShrink = sender.view!
        viewToShrink.removeConstraints(viewToShrink.constraints)
        
        UIView.animate(withDuration: 0.5, animations: {
            viewToShrink.frame = self.storedFrame!
        }) { (c) in
            viewToShrink.removeFromSuperview()
        }
        
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyTableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopUpCardTableViewCell.identifier, for: indexPath) as! PopUpCardTableViewCell
        cell.selectionStyle = .none
        cell.popUpCardView.title = dummyTableViewData[indexPath.row]
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat.popUpCardViewHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! PopUpCardTableViewCell
        makeCellPopOut(cell, indexPath: indexPath)
    }
    
    func makeCellPopOut(_ cell: PopUpCardTableViewCell, indexPath: IndexPath) {
        let window = UIApplication.shared.keyWindow!
        // 1. Get the equivalent/converted rect of the cell's popUpCardView as if it is in the window
        let convertedRect = cell.convert(cell.popUpCardView.frame, to: window)
        
        // 2. Create a dummy view on window, initializing it with the converted rect.
        let dummyView = PopUpCardView(frame: convertedRect)//UIView(frame: convertedRect)
        dummyView.title = dummyTableViewData[indexPath.row]
        dummyView.backgroundColor = UIColor.gray
        window.addSubview(dummyView)
        
        // 2.5 Add a gesture recognizer to it so that it can be easily removed when tapped.
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dummyViewTapGestureHandler(_:)))
        dummyView.addGestureRecognizer(tapGesture)
        
        // ANIMATION PART!:
        dummyView.translatesAutoresizingMaskIntoConstraints = false
        
        dummyView.topAnchor.constraint(equalTo: window.topAnchor).isActive = true
        dummyView.leadingAnchor.constraint(equalTo: window.leadingAnchor).isActive = true
        dummyView.trailingAnchor.constraint(equalTo: window.trailingAnchor).isActive = true
        dummyView.bottomAnchor.constraint(equalTo: window.bottomAnchor).isActive = true
        
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.50, initialSpringVelocity: 0.10, options: .curveEaseInOut, animations: {
            window.layoutIfNeeded()
        }) { (c) in
        }
        
        storedFrame = convertedRect
        
    }

}



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

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyTableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopUpCardTableViewCell.identifier, for: indexPath) as! PopUpCardTableViewCell
        cell.popUpCardView.title = dummyTableViewData[indexPath.row]
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat.popUpCardViewHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }

}



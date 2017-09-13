//
//  AulaViewController.swift
//  Mobile
//
//  Created by Breno Aquino on 01/09/17.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit
import AMScrollingNavbar

class AulaViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var fatherNavigationController: ScrollingNavigationController!
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: "AulaTableViewCell", bundle: nil), forCellReuseIdentifier: "cellAula")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fatherNavigationController.followScrollView(self.tableView, delay: 25)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        fatherNavigationController.showNavbar(animated: false)
        
        fatherNavigationController.stopFollowingScrollView()
    }
    
    // MARK: - TableView Methods
    
    public func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 50
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cellAula", for: indexPath) as! AulaTableViewCell
        
        cell.label.text = "Row \(indexPath.row)"
        
        return cell
    }
}

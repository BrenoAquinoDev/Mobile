//
//  SideBarTableViewController.swift
//  Mobile
//
//  Created by Breno Aquino on 01/09/17.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit
import AMScrollingNavbar

class SideBarTableViewController: UITableViewController {

    var perfilViewController: UIViewController!
    var disciplinaViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let controllerPerfil = StoryboardScene.Main.perfilViewControllerID.instantiate()
        
        self.perfilViewController = UINavigationController(rootViewController: controllerPerfil)
        
        
        let controllerDisciplina = StoryboardScene.Disciplina.disciplinaViewControllerID.instantiate()
        
        self.disciplinaViewController = ScrollingNavigationController(rootViewController: controllerDisciplina)
        
        
        self.tableView.separatorStyle = .none
        
        self.tableView.separatorColor = .black
        
        self.tableView.tableFooterView = UIView()
        
    }

    // MARK: - TableView Methods

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view: UIView = UIView()
        
        view.backgroundColor = #colorLiteral(red: 0.01202730276, green: 0.3897084594, blue: 0.8242080808, alpha: 1)
        
        return view
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0:
            
            self.slideMenuController()?.changeMainViewController(self.perfilViewController, close: true)
            
        case 1:
            
            self.slideMenuController()?.changeMainViewController(self.disciplinaViewController, close: true)
            
        default:
            break
        }
    }
}

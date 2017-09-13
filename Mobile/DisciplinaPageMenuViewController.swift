//
//  DisciplinaPageMenuViewController.swift
//  Mobile
//
//  Created by Breno Aquino on 01/09/17.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit
import PageMenu
import AMScrollingNavbar

class DisciplinaPageMenuViewController: UIViewController, CAPSPageMenuDelegate {

    var pageMenu: CAPSPageMenu?
    
    var nomeDisciplina: String!
    
    var color: UIColor!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = nomeDisciplina
        
        // MARK: Cor da NavigationBar
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(color: color, size: CGSize(width: 1, height: 1)), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage(color: color, size: CGSize(width: 1, height: 1))
        
        // MARK: PageMenu
        
        var controllers: [UIViewController] = []
        
        
        let infoDisciplinaViewController = InfoDisciplinaViewController(nibName: "InfoDisciplinaViewController", bundle: nil)
        
        infoDisciplinaViewController.title = L10n.Disciplina.info
        
        controllers.append(infoDisciplinaViewController)
        
        
        let frequenciaViewController = FrequenciaViewController(nibName: "FrequenciaViewController", bundle: nil)
        
        frequenciaViewController.title = L10n.Disciplina.frequencia
        
        controllers.append(frequenciaViewController)
        
        
        let aulaViewController = AulaViewController(nibName: "AulaViewController", bundle: nil)
        
        aulaViewController.title = L10n.Disciplina.aula
        
        controllers.append(aulaViewController)
        
        
        let transparente = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0)
        
        let parameters: [CAPSPageMenuOption] = [
            
            .menuItemSeparatorWidth(4.3),
            
            .useMenuLikeSegmentedControl(true),
            
            .menuItemSeparatorColor(transparente),
            
            .scrollMenuBackgroundColor(color),
            
            .menuItemSeparatorPercentageHeight(0.1),
            
            .unselectedMenuItemLabelColor(.white),
            
            .selectedMenuItemLabelColor(.white)
        ]
        
        
        self.pageMenu = CAPSPageMenu(viewControllers: controllers, frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        
        self.view.addSubview(pageMenu!.view)
        
        self.pageMenu?.delegate = self
    }
    
    func willMoveToPage(_ controller: UIViewController, index: Int) {
        
        if let aulaViewController = controller as? AulaViewController {
            
            if let navigation = self.navigationController as? ScrollingNavigationController {
                
                aulaViewController.fatherNavigationController = navigation
            }
        }
    }
}

//
//  CustomSlideBar.swift
//  Mobile
//
//  Created by Breno Aquino on 01/09/17.
//  Copyright © 2017 Breno Aquino. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class CustomSlideBarController: SlideMenuController {

    override func viewDidLoad() {
        super.viewDidLoad()

        SlideMenuOptions.leftViewWidth = 210
        
        SlideMenuOptions.animationDuration = 0.5
        
        SlideMenuOptions.hideStatusBar = false
        
    }
}

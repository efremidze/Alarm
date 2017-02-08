//
//  ViewController.swift
//  Alarm
//
//  Created by Lasha Efremidze on 1/9/17.
//  Copyright © 2017 Lasha Efremidze. All rights reserved.
//

import UIKit
import RevealingSplashView

class ViewController: UIViewController {
    
    lazy var splashView: RevealingSplashView = { [unowned self] in
        let view = RevealingSplashView(iconImage: UIImage(named: "weed")!, iconInitialSize: CGSize(width: 100, height: 100), backgroundColor: .weedGreen)
        self.view.addSubview(view)
        return view
    }()
    
    lazy var tableView: TableViewController = { [unowned self] in
        let viewController = TableViewController(style: .grouped)
        self.view.addSubview(viewController.view)
        viewController.view.constrainToEdges()
        return viewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = tableView
        
        splashView.startAnimation()
    }
    
}

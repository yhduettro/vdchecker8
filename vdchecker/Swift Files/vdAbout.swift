//
//  vdAbout.swift
//  vdchecker
//
//  Created by younghwan moon on 7/14/14.
//  Copyright (c) 2014 jgoplay. All rights reserved.
//

import UIKit

class vdAbout : UIViewController {
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        configureTextView()
    }
    
    func configureTextView() {
        
        let image = UIImage(named: "topbar_about.png") as UIImage
        navigationController.navigationBar.setBackgroundImage(image, forBarMetrics: .Default)
    }
}

//
//  thirdViewController.swift
//  cell2
//
//  Created by dsav on 8/4/20.
//  Copyright © 2020 dsav. All rights reserved.
//

import UIKit

class menuViewController: UIViewController {
    
    @IBOutlet weak var cellBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellBtn.layer.cornerRadius = 10
        cellBtn.clipsToBounds = true
    }
}
//
//  alert.swift
//  cell2
//
//  Created by dsav on 8/4/20.
//  Copyright © 2020 dsav. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    public static func showAlert(on vc: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}
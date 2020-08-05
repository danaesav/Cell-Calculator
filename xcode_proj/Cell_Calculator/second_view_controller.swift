//
//  SecondViewController.swift
//  cell3
//
//  Created by dsav on 7/27/20.
//  Copyright © 2020 dsav. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {


    @IBOutlet weak var wells: UITextField!
    @IBOutlet weak var volwel: UITextField!
    
    @IBOutlet weak var ans: UITextView!
    @IBOutlet weak var finalAns: UITextView!
    
    @IBOutlet weak var finalCalc: UIButton!
    
    var n1 = 6
    var n2 = 6
    var n3 = 6
    var n4 = 6
    var n5 = 6
    var n6 = 6
    var n7 = 6
    var n8 = 6
    var dil = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TOOLBAR COMMANDS
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        
        //DONE BUTTON ON TOOLBAR
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
            
            toolBar.setItems([doneButton], animated: false)
        
        wells.inputAccessoryView = toolBar
        volwel.inputAccessoryView = toolBar
        
        //-----------------------------------------------
        
        //calculating average
        let aver = Int((n1+n2+n3+n4+n5+n6+n7+n8)/8)
        
        //stalo = Cells/ml
        let stalo = Int(aver * dil * 10000)
        
        ans.text = "\(stalo) Cells/ml"
        
        finalCalc.layer.cornerRadius = 10
        finalCalc.clipsToBounds = true
        volwel.keyboardType = UIKeyboardType.numberPad
        
        
    }
    
    @IBAction func calcFinal(_ sender: Any) {
        
        if self.wells.text?.isEmpty ?? true {
            Alert.showAlert(on: self, with: "Empty Fields", message: "One or more fields are empty")
        } else if self.volwel.text?.isEmpty ?? true {
            Alert.showAlert(on: self, with: "Empty Fields", message: "One or more fields are empty")
        } else {
            let well = Int(wells.text!)
            let volwell = Int(volwel.text!)
            
            //calculating average
            let aver = Int((n1+n2+n3+n4+n5+n6+n7+n8)/8)
            
            //stalo = cells/ml
            let stalo = Int(aver * dil * 10000)
            
            //stalo2 = Microliters of Cells
            let stalo21 = Int(well! * dil)
            let stalo22 = Int(stalo21 * 1000000)
            
            let stalo2 = Int(stalo22 / stalo)
            
            //Microliters of DMEM
            let stalo3 = Int((well! * volwell!) - stalo2)
            
            finalAns.text = "\(stalo) Cells/ml total \n\(stalo2) Microliters of Cells \n\(stalo3) Microliters of DMEM"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        wells.resignFirstResponder()
        volwel.resignFirstResponder()
        return true
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
}
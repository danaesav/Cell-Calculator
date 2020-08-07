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
    
    // Defining Variables
    var n1 = 0
    var n2 = 0
    var n3 = 0
    var n4 = 0
    var n5 = 0
    var n6 = 0
    var n7 = 0
    var n8 = 0
    var dil = 0
    var cn = 0
    
    // Function that runs when the View Controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // ACCESSORIES
        
        // Creating Toolbar for keyboard
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        // Creating done button on toolbar
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        toolBar.setItems([doneButton], animated: false)
        
        // Adding the toolbar to the text fields
        wells.inputAccessoryView = toolBar
        volwel.inputAccessoryView = toolBar
        
        // Customizing the buttons and setting keyboard type
        finalCalc.layer.cornerRadius = 10
        finalCalc.clipsToBounds = true
        volwel.keyboardType = UIKeyboardType.numberPad
        
    // CALCULATIONS
        
        // Doing the average and Cells/ml calculations according to the choice of the user
        if cn == 0 {
            let aver = Int((n1+n2+n3+n4)/4)
            let stalo = Int(aver * dil * 10000) //stalo = Cells/ml
            ans.text = "\(stalo) Cells/ml" //printing the result
        } else if cn == 1 {
            let aver = Int((n1+n2+n3+n4+n5+n6+n7+n8)/8)
            let stalo = Int(aver * dil * 10000) //stalo = Cells/ml
            ans.text = "\(stalo) Cells/ml" //printing the result
        }
        
    }
    
    // Button that calculates and prints the Cells/ml, Micoliters of Cells and Microliters of DMEM
    @IBAction func calcFinal(_ sender: Any) {
        
        // Checking if the fields are not empty
        if self.wells.text?.isEmpty ?? true {
            Alert.showAlert(on: self, with: "Empty Fields", message: "One or more fields are empty")
        } else if self.volwel.text?.isEmpty ?? true {
            Alert.showAlert(on: self, with: "Empty Fields", message: "One or more fields are empty")
        } else {
            // If the fields are not empty
            // Getting the input from the text fields
            let well = Int(wells.text!)
            let volwell = Int(volwel.text!)
            
            // Calculating according to the choice of the user
            if cn == 0 {
                let aver = Int((n1+n2+n3+n4)/4)
                let stalo = Int(aver * dil * 10000) // stalo = Cells/ml
                let stalo21 = Int(well! * dil) // 1st calc
                let stalo22 = Int(stalo21 * 1000000) // 2nd calc
                
                // Microliters of Cells (stalo2)
                let stalo2 = Int(stalo22 / stalo) // Final Calc
                
                // Microliters of DMEM (stalo3)
                let stalo3 = Int((well! * volwell!) - stalo2)
                
                // printing the result
                finalAns.text = "\(stalo) Cells/ml total \n\(stalo2) Microliters of Cells \n\(stalo3) Microliters of DMEM"
                
            } else if cn == 1 {
                let aver = Int((n1+n2+n3+n4+n5+n6+n7+n8)/8)
                let stalo = Int(aver * dil * 10000) // stalo = Cells/ml
                let stalo21 = Int(well! * dil) // 1st calc
                let stalo22 = Int(stalo21 * 1000000) // 2st calc
                
                // Microliters of Cells (stalo2)
                let stalo2 = Int(stalo22 / stalo) // Final Calc
                
                // Microliters of DMEM
                let stalo3 = Int((well! * volwell!) - stalo2)
                
                // printing the result
                finalAns.text = "\(stalo) Cells/ml total \n\(stalo2) Microliters of Cells \n\(stalo3) Microliters of DMEM"
            }
        }
    }
    
    // Functions for the done button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        wells.resignFirstResponder()
        volwel.resignFirstResponder()
        return true
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
}
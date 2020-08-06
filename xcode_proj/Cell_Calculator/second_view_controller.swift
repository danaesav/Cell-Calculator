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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if cn == 0 {
            let aver = Int((n1+n2+n3+n4)/4)
            let stalo = Int(aver * dil * 10000)
            ans.text = "\(stalo) Cells/ml"
        } else if cn == 1 {
            let aver = Int((n1+n2+n3+n4+n5+n6+n7+n8)/8)
            let stalo = Int(aver * dil * 10000)
            ans.text = "\(stalo) Cells/ml"
        }
        
        finalCalc.layer.cornerRadius = 10
        finalCalc.clipsToBounds = true
        volwel.keyboardType = UIKeyboardType.numberPad
        
        //TOOLBAR COMMANDS
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        
        //DONE BUTTON ON TOOLBAR
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
            
            toolBar.setItems([doneButton], animated: false)
        
        wells.inputAccessoryView = toolBar
        volwel.inputAccessoryView = toolBar
        
        //-----------------------------------------------
        
        //stalo = Cells/ml
        
    }
    
    @IBAction func calcFinal(_ sender: Any) {
        
        if self.wells.text?.isEmpty ?? true {
            Alert.showAlert(on: self, with: "Empty Fields", message: "One or more fields are empty")
        } else if self.volwel.text?.isEmpty ?? true {
            Alert.showAlert(on: self, with: "Empty Fields", message: "One or more fields are empty")
        } else {
            let well = Int(wells.text!)
            let volwell = Int(volwel.text!)
            if cn == 0 {
                let aver = Int((n1+n2+n3+n4)/4)
                let stalo = Int(aver * dil * 10000)
                let stalo21 = Int(well! * dil)
                let stalo22 = Int(stalo21 * 1000000)
                
                let stalo2 = Int(stalo22 / stalo)
                
                //Microliters of DMEM
                let stalo3 = Int((well! * volwell!) - stalo2)
                
                finalAns.text = "\(stalo) Cells/ml total \n\(stalo2) Microliters of Cells \n\(stalo3) Microliters of DMEM"
                
            } else if cn == 1 {
                let aver = Int((n1+n2+n3+n4+n5+n6+n7+n8)/8)
                let stalo = Int(aver * dil * 10000)
                let stalo21 = Int(well! * dil)
                let stalo22 = Int(stalo21 * 1000000)
                
                let stalo2 = Int(stalo22 / stalo)
                
                //Microliters of DMEM
                let stalo3 = Int((well! * volwell!) - stalo2)
                
                finalAns.text = "\(stalo) Cells/ml total \n\(stalo2) Microliters of Cells \n\(stalo3) Microliters of DMEM"
            }
            //stalo = cells/ml
            
            //stalo2 = Microliters of Cells
            
            
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

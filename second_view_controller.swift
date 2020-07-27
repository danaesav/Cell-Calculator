//
//  ViewController.swift
//  cell4
//
//  Created by dsav on 7/24/20.
//  Copyright © 2020 dsav. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!
    @IBOutlet weak var number4: UITextField!
    @IBOutlet weak var number5: UITextField!
    @IBOutlet weak var number6: UITextField!
    @IBOutlet weak var number7: UITextField!
    @IBOutlet weak var number8: UITextField!
    @IBOutlet weak var dilution: UITextField!
    @IBOutlet weak var wells: UITextField!
    @IBOutlet weak var volwell: UITextField!
    
    
    @IBOutlet weak var calcbtn: UIButton!
    @IBOutlet weak var finalAns: UIButton!
    
    
    @IBOutlet weak var ans: UITextView!
    @IBOutlet weak var finalOut: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calcbtn.layer.cornerRadius = 10
        calcbtn.clipsToBounds = true
        finalAns.layer.cornerRadius = 10
        finalAns.clipsToBounds = true
        ans.layer.cornerRadius = 10
        ans.clipsToBounds = true
        finalOut.layer.cornerRadius = 10
        finalOut.clipsToBounds = true
        
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
            
            toolBar.setItems([doneButton], animated: false)
        
        wells.keyboardType = UIKeyboardType.numberPad
        dilution.keyboardType = UIKeyboardType.numberPad
        volwell.keyboardType = UIKeyboardType.numberPad
        number1.keyboardType = UIKeyboardType.numberPad
        number2.keyboardType = UIKeyboardType.numberPad
        number3.keyboardType = UIKeyboardType.numberPad
        number4.keyboardType = UIKeyboardType.numberPad
        number5.keyboardType = UIKeyboardType.numberPad
        number6.keyboardType = UIKeyboardType.numberPad
        number7.keyboardType = UIKeyboardType.numberPad
        number8.keyboardType = UIKeyboardType.numberPad
        
        wells.inputAccessoryView = toolBar
        dilution.inputAccessoryView = toolBar
        volwell.inputAccessoryView = toolBar
        number1.inputAccessoryView = toolBar
        number2.inputAccessoryView = toolBar
        number3.inputAccessoryView = toolBar
        number4.inputAccessoryView = toolBar
        number5.inputAccessoryView = toolBar
        number6.inputAccessoryView = toolBar
        number7.inputAccessoryView = toolBar
        number8.inputAccessoryView = toolBar
        
        wells.delegate = self
        dilution.delegate = self
        volwell.delegate = self
        number1.delegate = self
        number2.delegate = self
        number3.delegate = self
        number4.delegate = self
        number5.delegate = self
        number6.delegate = self
        number7.delegate = self
        number8.delegate = self
        
    }

    @IBAction func calc(_ sender: Any) {
        let numb1 = Int(number1.text!)
        let numb2 = Int(number2.text!)
        let numb3 = Int(number3.text!)
        let numb4 = Int(number4.text!)
        let numb5 = Int(number5.text!)
        let numb6 = Int(number6.text!)
        let numb7 = Int(number7.text!)
        let numb8 = Int(number8.text!)
            
        let summ = Int(numb1! + numb2! + numb3! + numb4! + numb5! + numb6! + numb7! + numb8!)
        let aver = Int(summ / 8)
            
        //stalo = Cells/ml
        let stalo = Int(aver * 5 * 10000)
        
        ans.text = "\(stalo) Cells/ml"
    }
    
    
    @IBAction func finalAns(_ sender: Any) {
        let numb1 = Int(number1.text!)
        let numb2 = Int(number2.text!)
        let numb3 = Int(number3.text!)
        let numb4 = Int(number4.text!)
        let numb5 = Int(number5.text!)
        let numb6 = Int(number6.text!)
        let numb7 = Int(number7.text!)
        let numb8 = Int(number8.text!)
        let wellsnumb = Int(wells.text!)
        let volwe = Int(volwell.text!)
        let dil = Int(dilution.text!)
        
        let summ = Int(numb1! + numb2! + numb3! + numb4! + numb5! + numb6! + numb7! + numb8!)
        let aver = Int(summ / 8)
        
        //stalo = Cells/ml total
        let stalo = Int(aver * 5 * 10000)
        
        //stalo2 = Microliters of Cells
        let stalo21 = Int(wellsnumb! * dil!)
        let stalo22 = Int(stalo21 * 1000000)
        
        let stalo2 = Int(stalo22 / stalo)
        
        //Microliters of DMEM
        let stalo3 = Int(wellsnumb! * volwe! - stalo2)
        
        finalOut.text = "\(stalo) Cells/ml total \n\(stalo2) Microliters of Cells \n\(stalo3) Microliters of DMEM"
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        wells.resignFirstResponder()
        volwell.resignFirstResponder()
        number1.resignFirstResponder()
        number2.resignFirstResponder()
        number3.resignFirstResponder()
        number4.resignFirstResponder()
        number5.resignFirstResponder()
        number6.resignFirstResponder()
        number7.resignFirstResponder()
        number8.resignFirstResponder()
        return true
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
    }
    
}
//
//  ViewController.swift
//  cell3
//
//  Created by dsav on 7/27/20.
//  Copyright © 2020 dsav. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!
    @IBOutlet weak var number4: UITextField!
    @IBOutlet weak var number5: UITextField!
    @IBOutlet weak var number6: UITextField!
    @IBOutlet weak var number7: UITextField!
    @IBOutlet weak var number8: UITextField!
    @IBOutlet weak var dilution: UITextField!
    @IBOutlet weak var choose: UISegmentedControl!
    
    @IBOutlet weak var calcbtn: UIButton!
    @IBOutlet weak var resetbtn: UIButton!
    
    // Defining the variables
    var numb1 = 0
    var numb2 = 0
    var numb3 = 0
    var numb4 = 0
    var numb5 = 0
    var numb6 = 0
    var numb7 = 0
    var numb8 = 0
    var celln = 0
    var dilu = 0
    var choi = 0
    
    // Function that runs when the View Controller loads
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // ACCESSORIES
        
        // Creating Toolbar for keyboard
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        // Creating Done button on Toolbar
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
        toolBar.setItems([doneButton], animated: false)
        
        // Adding the Toolbar to the text fields
        dilution.inputAccessoryView = toolBar
        number1.inputAccessoryView = toolBar
        number2.inputAccessoryView = toolBar
        number3.inputAccessoryView = toolBar
        number4.inputAccessoryView = toolBar
        number5.inputAccessoryView = toolBar
        number6.inputAccessoryView = toolBar
        number7.inputAccessoryView = toolBar
        number8.inputAccessoryView = toolBar
        
        // Customizing the buttons and setting keyboard type
        resetbtn.layer.cornerRadius = 10
        resetbtn.clipsToBounds = true
        calcbtn.layer.cornerRadius = 10
        calcbtn.clipsToBounds = true
    }
    
    // Reset Button
    @IBAction func reset(_ sender: Any) {
        number1.text = ""
        number2.text = ""
        number3.text = ""
        number4.text = ""
        number5.text = ""
        number6.text = ""
        number7.text = ""
        number8.text = ""
        dilution.text = ""
    }
    
    // Function that checks if the fields are empty or not on segmented choice 1
    func check1() -> Bool {
        if (self.number1.text?.isEmpty) ?? true || self.number2.text?.isEmpty ?? true || self.number3.text?.isEmpty ?? true || self.number4.text?.isEmpty ?? true || self.dilution.text?.isEmpty ?? true || !(self.number5.text?.isEmpty ?? true) || !(self.number6.text?.isEmpty ?? true) || !(self.number7.text?.isEmpty ?? true) || !(self.number8.text?.isEmpty ?? true) {
            return false
        } else {
            return true
        }
    }
    
    // Function that checks if the fields are empty or not on segmented choice 2
    func check2() -> Bool {
        if (self.number1.text?.isEmpty) ?? true || self.number2.text?.isEmpty ?? true || self.number3.text?.isEmpty ?? true || self.number4.text?.isEmpty ?? true || self.number5.text?.isEmpty ?? true || self.number6.text?.isEmpty ?? true || self.number7.text?.isEmpty ?? true || self.number8.text?.isEmpty ?? true || self.dilution.text?.isEmpty ?? true {
            return false
        } else {
            return true
        }
    }
    
    // The segmented control function
    @IBAction func choice(_ sender: Any) {
    }
 
    // Button that calculates and performs segue with "turner"
    @IBAction func calc(_ sender: Any) {
        
        // Check if dilution text field is empty
        if (self.dilution.text?.isEmpty ?? true) {
            Alert.showAlert(on: self, with: "Empty Fields", message: "Dilution field is empty")
        }
        
        // Check if the text fields are empty and if so show alert
        if choose.selectedSegmentIndex == 0 {
            if (self.number1.text?.isEmpty) ?? true || self.number2.text?.isEmpty ?? true || self.number3.text?.isEmpty ?? true || self.number4.text?.isEmpty ?? true || !(self.number5.text?.isEmpty ?? true) || !(self.number6.text?.isEmpty ?? true) || !(self.number7.text?.isEmpty ?? true) || !(self.number8.text?.isEmpty ?? true) {
                Alert.showAlert(on: self, with: "Empty Fields", message: "Number 1-4 fields should not be empty and Numbers 5-8 should be empty")
            } else {
                // If not, perform segue
                performSegue(withIdentifier: "turner", sender: self)
            }
        } else { //Same thing for the second choice
            if (self.number1.text?.isEmpty) ?? true || self.number2.text?.isEmpty ?? true || self.number3.text?.isEmpty ?? true || self.number4.text?.isEmpty ?? true || self.number5.text?.isEmpty ?? true || self.number6.text?.isEmpty ?? true || self.number7.text?.isEmpty ?? true || self.number8.text?.isEmpty ?? true {
                Alert.showAlert(on: self, with: "Empty Fields", message: "Number 1-8 fields should not be empty")
            } else {
                performSegue(withIdentifier: "turner", sender: self)
            }
        }
    }
    
    // Prepare for segue func that send the input of the text fields to the SecondViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var vc = segue.destination as! SecondViewController

        if check1() == true {
            vc.n1 = Int(number1.text!)!
            vc.n2 = Int(number2.text!)!
            vc.n3 = Int(number3.text!)!
            vc.n4 = Int(number4.text!)!
            vc.dil = Int(dilution.text!)!
            vc.cn = Int(choose.selectedSegmentIndex)

        } else if check2() == true {
            vc.n1 = Int(number1.text!)!
            vc.n2 = Int(number2.text!)!
            vc.n3 = Int(number3.text!)!
            vc.n4 = Int(number4.text!)!
            vc.n5 = Int(number5.text!)!
            vc.n6 = Int(number6.text!)!
            vc.n7 = Int(number7.text!)!
            vc.n8 = Int(number8.text!)!
            vc.cn = Int(choose.selectedSegmentIndex)
            vc.dil = Int(dilution.text!)!
        }
    }
    
    // Functions for the done button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
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
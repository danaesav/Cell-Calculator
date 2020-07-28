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
    
    @IBOutlet weak var calcbtn: UIButton!
    
    var numb1 = 4
    var numb2 = 2
    var numb3 = 45
    var numb4 = 43
    var numb5 = 54
    var numb6 = 8
    var numb7 = 21
    var numb8 = 93
    var dilu = 32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calcbtn.layer.cornerRadius = 10
        calcbtn.clipsToBounds = true
        
        let toolBar = UIToolbar()
        
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.doneClicked))
            
            toolBar.setItems([doneButton], animated: false)
        
        dilution.inputAccessoryView = toolBar
        number1.inputAccessoryView = toolBar
        number2.inputAccessoryView = toolBar
        number3.inputAccessoryView = toolBar
        number4.inputAccessoryView = toolBar
        number5.inputAccessoryView = toolBar
        number6.inputAccessoryView = toolBar
        number7.inputAccessoryView = toolBar
        number8.inputAccessoryView = toolBar
    }

    @IBAction func calc(_ sender: Any) {
        self.numb1 = Int(number1.text!)!
        self.numb2 = Int(number2.text!)!
        self.numb3 = Int(number3.text!)!
        self.numb4 = Int(number4.text!)!
        self.numb5 = Int(number5.text!)!
        self.numb6 = Int(number6.text!)!
        self.numb7 = Int(number7.text!)!
        self.numb8 = Int(number8.text!)!
        self.dilu = Int(dilution.text!)!
        
        performSegue(withIdentifier: "turner", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! SecondViewController
        vc.n1 = self.numb1
        vc.n2 = self.numb2
        vc.n3 = self.numb3
        vc.n4 = self.numb4
        vc.n5 = self.numb5
        vc.n6 = self.numb6
        vc.n7 = self.numb7
        vc.n8 = self.numb8
        vc.dil = self.dilu
    }
    
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
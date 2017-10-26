//
//  ViewController.swift
//  TipCalculator
//
//  Created by Rimil Dey on 23/10/17.
//  Copyright © 2017 Rimil Dey. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        subtotalTextfield.becomeFirstResponder()
        createToolbar()
        tipPercentSlider.isEnabled = false
    }
    
    // MARK: - outlets
    @IBOutlet weak var subtotalTextfield: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var tipAmoutLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    // MARK: - interactions
    
    @IBAction func dragSlider(_ sender: UISlider) {
        tipLabel.text = "Tip ( \(Int(sender.value)) %  ):"
        model.tipPercentFromSlider = Int(sender.value)
        updateLabel()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tipPercentSlider.isEnabled = false
    }
    
    // MARK: - properties
    var model = Model()
     
    // MARK: - functions
    
    func createToolbar()
    {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.sizeToFit()
        
        //create bar button items
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(dismissKeyboard))
        
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: self,
            action: nil)
        
        //add items to toolbar
        toolbar.setItems([flexibleSpace, doneButton], animated: true)
        
        //add toolbar to keyboard
        subtotalTextfield.inputAccessoryView = toolbar
    }
    
    func dismissKeyboard ()
    {
        subtotalTextfield.resignFirstResponder()
        tipPercentSlider.isEnabled = true

        
        if subtotalTextfield.text?.characters.count == 0 {
            subtotalTextfield.text = "$0.00"
            model.subtotalFromTextField = "0.00"
            updateLabel()
            
        } else {
            
            model.subtotalFromTextField = subtotalTextfield.text!
            model.tipPercentFromSlider = Int(tipPercentSlider.value)
            
            updateLabel()
        }
    }
    
    func updateLabel () {
        //update labels
        subtotalTextfield.text = model.subtotalAsCurrency
        tipAmoutLabel.text = model.tipAmountAsCurrency
        totalAmountLabel.text = model.totalAmountAsCurrency

    }
}


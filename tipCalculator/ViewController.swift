//
//  ViewController.swift
//  tipCalculator
//
//  Created by David Neuman on 12/31/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var splitCounter: UIStepper!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var youEachOweLabel: UILabel!
    
    @IBOutlet weak var totalEachLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
    




    
    @IBAction func calculateTip(_ sender: Any) {
        // Get the bill amount
        let bill = Double(billField.text!) ?? 0
        
        // Calculate the tip and total
        let tipPercentages = [0.15, 0.18, 0.20, 0.25]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        
        let numPeople = Double(splitLabel.text!) ?? 1
        

        let total = bill + tip
        
        let totalEach = (bill + tip) / numPeople
        
        if numPeople > 1{
            youEachOweLabel.text = "You each owe"
            totalEachLabel.text = String(format: "$%.2f",totalEach)
            
        } else{
            youEachOweLabel.text = ""
            totalEachLabel.text = ""
        }
        
        
        // Update the tip and total labels
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    //split tip
    @IBAction func splitCounterIncrement(_ sender: UIStepper) {
        
        splitLabel.text = Int(sender.value).description

        calculateTip(self)
    }

    
}


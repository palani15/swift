//
//  DetailViewController.swift
//  algorithm
//
//  Created by Palaniappan Vairavan on 2/17/16.
//  Copyright © 2016 Sivasoft. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var unSortedNumbers: UITextField!
    
    @IBOutlet weak var numbers: UITextField!
    
    @IBOutlet weak var from: UITextField!
    
    @IBOutlet weak var to: UITextField!
    
    @IBOutlet weak var sortPicker: UIPickerView!
    
    @IBOutlet weak var sortedNumbers: UITextField!
    
    @IBOutlet weak var seconds: UILabel!
    
    @IBOutlet weak var sortButton: UIButton!
    
    @IBOutlet weak var unSortedLabel: UILabel!
    
    @IBOutlet weak var orLabel: UILabel!
    
    @IBOutlet weak var chooseLabel: UILabel!
    
    @IBOutlet weak var numbersLabel: UILabel!
    
    @IBOutlet weak var fromLabel: UILabel!
    
    @IBOutlet weak var toLabel: UILabel!
    
    @IBOutlet weak var pickButton: UIButton!
    
    @IBOutlet weak var sortingOptionLabel: UILabel!
    
    @IBOutlet weak var sortedLabel: UILabel!
    
    @IBOutlet weak var timeTakenLabel: UILabel!
    
    
    var buttonColor: UIColor!
    
    let sortPickerData: [String] = ["Insertion", "Quick", "Merge", "Selection"]
    
    var inputNumbers: [Int?] = []
    
    var noInputValidationErrorTitle = NSLocalizedString("numbers not provided", comment: "no numbers text title for alert box")
    var noInputValidationErrorMessage = NSLocalizedString("Please enter the numbers to be sorted or Choose random numbers with its range", comment: "no numbers text for alert box")
    var invalidInputValidationErrorTitle = NSLocalizedString("Valid numbers not provided", comment: "valid numbers text title for alert box")
    var invalidInputValidationErrorMessage = NSLocalizedString("Please enter the valid numbers to be sorted or choose random numbers with its range", comment: "Valid numbers text for alert box")
    var okAlertTitle = NSLocalizedString("Ok", comment: "Ok title for alert box")
    
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
        
        self.sortPicker.delegate = self
        self.sortPicker.dataSource = self
        self.sortButton.enabled = false
        inputNumbers.removeAll()
        buttonColor = self.sortButton.backgroundColor!
        self.sortButton.backgroundColor = UIColor.lightGrayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(sortPickerView :UIPickerView) -> Int {
    return 1
    }
    
    func pickerView(sortPickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return sortPickerData.count
    }
    
    func pickerView( sortPickerView : UIPickerView, titleForRow row:Int, forComponent component: Int) -> String? {
    return sortPickerData[row]
    }
    
    @IBAction func pick(sender: UIButton) {
        if(unSortedNumbers.text != nil && !unSortedNumbers.text!.isEmpty) {
            self.inputNumbers = unSortedNumbers.text!.componentsSeparatedByString(",").map { Int($0)}
        }
        if((unSortedNumbers.text == nil || unSortedNumbers.text!.isEmpty) &&
            ((numbers.text == nil || numbers.text!.isEmpty) || (from.text == nil || from.text!.isEmpty) || (to.text == nil || to.text!.isEmpty))){
                let okAction: UIAlertAction = UIAlertAction(title: okAlertTitle, style: UIAlertActionStyle.Default, handler: { ACTION -> Void in
                    self.enableTextbox()
                })
                self.errorAlert( noInputValidationErrorTitle , message: noInputValidationErrorMessage, okAction: okAction)
        }
        else if(unSortedNumbers.text != nil && !unSortedNumbers.text!.isEmpty && self.inputNumbers.count == 0){
            self.errorAlert(invalidInputValidationErrorTitle, message: invalidInputValidationErrorMessage)
        }
        else {
            self.sortButton.enabled = true
            self.sortButton.backgroundColor = buttonColor
        }
    }
    
    
    @IBAction func sort(sender: UIButton) {
        let s = Sort()
        seconds.text = s.sayHello() + sortPickerData[sortPicker.selectedRowInComponent(0)]
        if(unSortedNumbers.text == nil || unSortedNumbers.text!.isEmpty) {
            
        }
        else {
           // let numberArr = unSortedNumbers.text!.componentsSeparatedByString(",").map { Int($0)}
            //sortedNumbers.text = numberArr[2].description 
        }
    }

    func enableTextbox() {
        self.numbers.enabled = true;
        self.from.enabled = true;
        self.to.enabled = true;
        self.unSortedNumbers.enabled = true;
        self.numbers.text = nil
        self.from.text = nil
        self.to.text = nil
        self.unSortedNumbers.text = nil
        self.numbers.backgroundColor = UIColor.whiteColor()
        self.from.backgroundColor = UIColor.whiteColor()
        self.to.backgroundColor = UIColor.whiteColor()
        self.unSortedNumbers.backgroundColor = UIColor.whiteColor()
    }
    
    func errorAlert(title : String, message : String, okAction : UIAlertAction) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alertViewController.addAction(okAction)
        self.presentViewController(alertViewController, animated: true, completion: nil)
    }
    
    func errorAlert(title : String, message : String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: okAlertTitle, style: UIAlertActionStyle.Default, handler: { ACTION -> Void in
        })
        alertViewController.addAction(okAction)
        self.presentViewController(alertViewController, animated: true, completion: nil)
    }
}


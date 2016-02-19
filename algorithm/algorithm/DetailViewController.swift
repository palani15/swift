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
    
    let sortPickerData: [String] = ["Insertion", "Quick", "Merge", "Selection"]
    
    @IBAction func pick(sender: UIButton) {
    }
    
    
    @IBAction func sort(sender: UIButton) {
        let s = Sort()
        seconds.text = s.sayHello() + sortPickerData[sortPicker.selectedRowInComponent(0)]
        
        if(unSortedNumbers.text == nil || unSortedNumbers.text!.isEmpty) {
            let alertViewController = UIAlertController(title: "Numbers not provided", message: "Please Enter the Numbers to be sorted in the TextBox", preferredStyle: UIAlertControllerStyle.Alert)
            let okAction: UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: { ACTION -> Void in
                self.unSortedNumbers.backgroundColor = UIColor.lightGrayColor()
            })
            alertViewController.addAction(okAction)
            self.presentViewController(alertViewController, animated: true, completion: nil)
        }
        else {
            let numberArr = unSortedNumbers.text!.componentsSeparatedByString(",").map { Int($0)!}
            sortedNumbers.text = numberArr[2].description }
    }

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
}


//
//  DetailViewController.swift
//  algorithm
//
//  Created by Palaniappan Vairavan on 2/17/16.
//  Copyright © 2016 Sivasoft. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    
    @IBOutlet weak var unSortedNumbers: UITextField!
    
    @IBOutlet weak var numbers: UITextField!
    
    @IBOutlet weak var from: UITextField!
    
    @IBOutlet weak var to: UITextField!
    
    @IBOutlet weak var sortPicker: UIPickerView!
    
    @IBOutlet weak var sortedNumbers: UITextField!
    
    @IBOutlet weak var seconds: UILabel!
    /*@IBOutlet weak var unSortedNumbers: UITextField!
    @IBOutlet weak var sortPicker: UIPickerView!
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var sortedNumbers: UITextField!
    @IBOutlet weak var seconds: UILabel!
    
    @IBOutlet weak var numbers: UITextField!
    @IBOutlet weak var from: UITextField!
    @IBOutlet weak var to: UITextField!*/
    

    @IBAction func pick(sender: UIButton) {
    }
    
    
    @IBAction func sort(sender: UIButton) {
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


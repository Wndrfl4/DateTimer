//
//  ViewController.swift
//  DateTimer
//
//  Created by Aslan  on 27.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var date1: UIDatePicker!
    
    @IBOutlet weak var date2: UIDatePicker!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "SecondVC" {
                    if let vc = segue.destination as? SecondViewController {
                        vc.dateFirst = date1.date
                        vc.dateSecond = date2.date
                    }
                }
            }

   
    
    
}


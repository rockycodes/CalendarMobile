//
//  EventFormViewController.swift
//  Calendar
//
//  Created by Rachel Fine on 6/25/18.
//  Copyright © 2018 Rachel Fine. All rights reserved.
//

import UIKit

class EventFormViewController: UIViewController {

    //maybe don't need to import all of these
    
    
    @IBOutlet weak var dayDateLabel: UILabel!
    @IBOutlet weak var startTimeEntry: UITextField!
    @IBOutlet weak var endTimeEntry: UITextField!
    @IBOutlet weak var descriptionEntry: UITextView!
    
    var selectedDay:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let date = self.selectedDay!
        self.dayDateLabel.text = "February \(date)"
        //self.descriptionEntry.clearsOnInsertion = true
    }
    @IBAction func submitPressed(_ sender: Any) {
        print(self.startTimeEntry.text!)
        print(self.endTimeEntry.text!)
        print(self.descriptionEntry.text!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

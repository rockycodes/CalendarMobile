//
//  EventFormViewController.swift
//  Calendar
//
//  Created by Rachel Fine on 6/25/18.
//  Copyright © 2018 Rachel Fine. All rights reserved.
//

import UIKit
import Firebase

class EventFormViewController: UIViewController {

    //maybe don't need to import all of these
    
    
    @IBOutlet weak var dayDateLabel: UILabel!
    @IBOutlet weak var startTimeEntry: UITextField!
    @IBOutlet weak var endTimeEntry: UITextField!
    @IBOutlet weak var descriptionEntry: UITextView!
    
    var db:Firestore!
    
    var selectedDay:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
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
    
    
    @IBAction func createEvent(_ sender: Any) {
        let startTime = self.startTimeEntry.text!
        let endTime = self.endTimeEntry.text!
        let description = self.descriptionEntry.text!
        db.collection(self.selectedDay!).document().setData([
            "startTime": startTime,
            "endTime": endTime,
            "description": description
        ]) { (error: Error?) in
            if let error = error {
                print("\(error.localizedDescription)")
            } else {
                print("Event created yayyyy!")
            }
        let homepage:ViewController = self.storyboard?.instantiateViewController(withIdentifier: "Homepage") as! ViewController
        self.navigationController?.pushViewController(homepage, animated: true)
    }
    
   
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

//
//  DayDetailsViewController.swift
//  Calendar
//
//  Created by Rachel Fine on 6/26/18.
//  Copyright © 2018 Rachel Fine. All rights reserved.
//

import UIKit


class DayDetailsViewController: UIViewController {

    @IBOutlet weak var eventsList: UITextView!
    @IBOutlet weak var dayDateLabel: UILabel!
    
    
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
        //PASS DATA DOWN FROM THE DAY YOU CLICKED ON DUHHHHH
        //MAKE THIS INTO A STACK VIEW WHERE EVERY ITEM IN THE STACK HAS START AND END TIME AND DESCRIPTION???
        
        //self.descriptionEntry.clearsOnInsertion = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func goToEventForm(_ sender: Any) {
        let eventFormViewPage:EventFormViewController = self.storyboard?.instantiateViewController(withIdentifier: "EventFormViewController") as! EventFormViewController
        eventFormViewPage.selectedDay = self.selectedDay
        //dayDetailsViewPage.selectedDay = String(date)
        self.navigationController?.pushViewController(eventFormViewPage, animated: true)
    }
    
}

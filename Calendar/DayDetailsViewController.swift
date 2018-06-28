//
//  DayDetailsViewController.swift
//  Calendar
//
//  Created by Rachel Fine on 6/26/18.
//  Copyright © 2018 Rachel Fine. All rights reserved.
//

import UIKit
import Firebase


class DayDetailsViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dayDateLabel: UILabel!
    var events : [Dictionary<String, Any>]! = []
    var selectedDay:String!
    var db:Firestore!

    override func viewDidLoad() {
        super.viewDidLoad()
        //I would like to avoid doing another data fetch here, but I couldn't figure out how to pass in the correct data for each day from the full month view because Firestore does not return data in a consistent order.
        db = Firestore.firestore()
        let date = self.selectedDay!
        self.dayDateLabel.text = "February \(date)"
        db.collection(date).getDocuments(){
            querySnapshot, error in
            if let error = error {
                print("in error statement")
                print("\(error.localizedDescription)")
            }else{
                let eventArr = querySnapshot!.documents.map{document in document.data()}
                self.events = eventArr
            }
            self.collectionView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.events.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let eventCell:DayDetailsCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath as IndexPath) as! DayDetailsCollectionViewCell
        let event = self.events![indexPath.item]
        eventCell.eventDetails.isEditable = false;
        eventCell.eventDetails.text = "Start Time: \(event["startTime"]!)\nEnd Time: \(event["endTime"]!)\nDescription: \(event["description"]!)"
        eventCell.backgroundColor = UIColor.cyan
        return eventCell
    }
    
    @IBAction func goToEventForm(_ sender: Any) {
        let eventFormViewPage:EventFormViewController = self.storyboard?.instantiateViewController(withIdentifier: "EventFormViewController") as! EventFormViewController
        eventFormViewPage.selectedDay = self.selectedDay
        self.navigationController?.pushViewController(eventFormViewPage, animated: true)
    }
    
}

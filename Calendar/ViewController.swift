//
//  ViewController.swift
//  Calendar
//
//  Created by Rachel Fine on 6/23/18.
//  Copyright © 2018 Rachel Fine. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var db:Firestore!
    var nums : [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20, 21, 22, 23, 24, 25, 26, 27, 28]

    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.nums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dayCell:DayCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "dayCell", for: indexPath as IndexPath) as! DayCollectionViewCell
        dayCell.eventDescriptions.isEditable = false;
        let date = String(self.nums[indexPath.item])
        db.collection(date).getDocuments(){
            querySnapshot, error in
            if let error = error {
                print("in error statement")
                print("\(error.localizedDescription)")
            }else{
                let eventArr = querySnapshot!.documents.map{document in document.data()}
                let descriptionArr = eventArr.map{event in event["description"]!} as! [String]
                //truncate all descriptions in the array to the first three letters and ...
                let truncatedDescArr:[String] = descriptionArr.map{description in
                    if description.count > 3 {
                        let idx = description.index(description.startIndex, offsetBy: 2)
                        let truncatedDesc = "\(String(description[...idx]))..."
                        return truncatedDesc
                    }
                    return description
                }
                var returnArr = [String]()
                //if there are more than three events to list, show the first three, and the sum of the events not shown
                if truncatedDescArr.count > 3 {
                    let idx = truncatedDescArr.index(truncatedDescArr.startIndex, offsetBy: 2)
                    returnArr = Array(truncatedDescArr[...idx])
                    let num = truncatedDescArr.count - 3
                    returnArr.append("\n+ \(num) more")
                }
                else {
                    returnArr = truncatedDescArr
                }
                let descriptionStr = returnArr.joined(separator: "\n")
                dayCell.eventDescriptions.text = descriptionStr
            }
        }
        dayCell.dateLabel.text = date
        dayCell.backgroundColor = UIColor.cyan
        return dayCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let dayDetailsViewPage:DayDetailsViewController = self.storyboard?.instantiateViewController(withIdentifier: "DayDetailsViewController") as! DayDetailsViewController
        let date = self.nums[indexPath.item]
        dayDetailsViewPage.selectedDay = String(date)
        self.navigationController?.pushViewController(dayDetailsViewPage, animated: true)
    }
}


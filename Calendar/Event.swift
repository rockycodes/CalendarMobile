//
//  Event.swift
//  Calendar
//
//  Created by Rachel Fine on 6/26/18.
//  Copyright © 2018 Rachel Fine. All rights reserved.
//

import Foundation
import Firebase

protocol DocumentSerializable {
    init?(dictionary:[String:Any])
}

struct Event {
    var startTime:String
    var endTime:String
    var description:String
    
    var dictionary:[String:Any]{
        return [
            "startTime":startTime,
            "endTime":endTime,
            "description":description
        ]
    }
}

extension Event:DocumentSerializable{
    init?(dictionary: [String:Any]){
        guard let startTime = dictionary["startTime"] as? String,
            let endTime = dictionary["endTime"] as? String,
            let description = dictionary["description"] as? String else {return nil}
        self.init(startTime:startTime, endTime:endTime, description:description)
    }
    
}

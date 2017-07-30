//
//  Model.swift
//  youtube
//
//  Created by Gabriella França on 24/07/17.
//  Copyright © 2017 letsbuildthatapp. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel? 
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
    
}

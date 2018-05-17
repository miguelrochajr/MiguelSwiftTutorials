//
//  Post.swift
//  TableViewProgrammatically
//
//  Created by Miguel Silva da Rocha Junior on 12/13/17.
//  Copyright © 2017 MiguelRochaJr. All rights reserved.
//

import UIKit

class Post {

    
    var price: String
    var location: String
    var description: String
    var image: UIImage
    
    init(price: String, location: String, description: String, image: UIImage) {
        self.price = price
        self.location = location
        self.description = description
        self.image = image
    }
}

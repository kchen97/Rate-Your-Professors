//
//  ClassType.swift
//  practiceApp
//
//  Created by Korman Chen on 9/15/17.
//  Copyright © 2017 Korman Chen. All rights reserved.
//

import UIKit

class Professor
{
    //Mark: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int)
    {
        guard !name.isEmpty else
        {
            return nil
        }
        
        guard (rating >= 0 && rating <= 5) else
        {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    
    
}

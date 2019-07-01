//
//  FeedModel.swift
//  itunesapp
//
//  Created by Maze Geek on 6/28/19.
//  Copyright © 2019 Amit Biswas. All rights reserved.
//

import Foundation
import UIKit


struct FeedModel: Decodable{
    
    var title: String
    let id: String
    let author: Author

    let copyright, country: String
    let icon: String
    let updated: String
var results: [Album]?
   
    
    
    
}

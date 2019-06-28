//
//  Result.swift
//  itunesapp
//
//  Created by Maze Geek on 6/28/19.
//  Copyright © 2019 Amit Biswas. All rights reserved.
//

import Foundation
import UIKit
struct Result: Decodable {
    let artistName, id, releaseDate, name: String
    
    let copyright, artistID: String
    let artistURL: String
    let artworkUrl100: String
    let genres: [Genre]
    let url: String
    let contentAdvisoryRating: String?
    
    enum CodingKeys: String, CodingKey {
        case artistName, id, releaseDate, name, kind, copyright
        case artistID = "artistId"
        case artistURL = "artistUrl"
        case artworkUrl100, genres, url, contentAdvisoryRating
    }
}

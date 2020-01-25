//
//  Movie.swift
//  movieSearch
//
//  Created by labuser on 10/19/18.
//  Copyright © 2018 bb. All rights reserved.
//

import Foundation
import UIKit

struct Movie: Codable{
    
    let id: Int!
    let poster_path: String?
    let title: String
    let release_date: String
    let vote_average: Double
    let overview: String
    let vote_count:Int!
    
    
}

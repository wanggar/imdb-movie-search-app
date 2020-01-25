//
//  APIResults.swift
//  movieSearch
//
//  Created by labuser on 10/19/18.
//  Copyright © 2018 bb. All rights reserved.
//

import Foundation


    

struct APIResults: Codable{
    
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: [Movie]
    
}




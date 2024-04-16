//
//  VideoModel.swift
//  Africa
//
//  Created by COMATOKI on 2024-04-20.
//

import Foundation

struct Video: Identifiable, Codable {
    let id: String
    let name: String
    let headline: String
    
    //Computed Property
    var thumnail: String {
        "video-\(id)"
    }
}

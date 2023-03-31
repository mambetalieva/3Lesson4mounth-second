//
//  NewsModel.swift
//  3Lesson4mounth
//
//  Created by Каира on 2.04.2023.
//

import Foundation

struct DataModel: Codable {
    let products: [Product]?
    let total, skip, limit: Int?
}
// mark Product
struct Product: Codable {
    let id: Int?
    let title, description: String?
    let thumbnail: String?
    
    init(id: Int?, title: String?, description: String? = nil, thumbnail: String? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.thumbnail = thumbnail
    }
}



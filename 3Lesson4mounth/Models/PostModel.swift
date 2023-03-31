//
//  PostModel.swift
//  3Lesson4mounth
//
//  Created by Каира on 2.04.2023.
//

import Foundation

struct PostDatum: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias PostData = [PostDatum]

//
//  Model.swift
//  TestTask
//
//  Created by Vasiliy Vygnych  on 25.10.2023.
//

import Foundation

// MARK: - DocsData
struct DocsData: Codable {
    var result: Result
}
// MARK: - Result
struct Result: Codable {
    let items: [ResultItem]
    let lastID: Int
    let lastSortingValue: Double
    let excludeIDS: [Int]

    enum CodingKeys: String, CodingKey {
        case items
        case lastID = "lastId"
        case lastSortingValue
        case excludeIDS = "excludeIds"
    }
}
// MARK: - ResultItem
struct ResultItem: Codable {
    let type: ItemType
    let data: ItemData
}
enum ItemType: String, Codable {
    case entry = "entry"
    case news = "news"
}
// MARK: - ItemData
struct ItemData: Codable {
    let lastID, id, type: Int?
    let author: NewsAuthor?
    let subsiteID: Int?
    let subsite: NewsAuthor?
    let title: String?
    let date: Int?
    let counters: Counters?
    let dateFavorite, hitsCount: Int?
    let likes: Likes?

    enum CodingKeys: String, CodingKey {
        case likes
        case lastID = "lastId"
        case id, type, author
        case subsiteID = "subsiteId"
        case subsite, title, date, counters, dateFavorite, hitsCount
    }
}
// MARK: - NewsAuthor
struct NewsAuthor: Codable {
    let name, description: String
    let avatar: Avatar
    let cover: Avatar?
    let lastModificationDate: Int
    let prevEntry: PrevEntry?

    enum CodingKeys: String, CodingKey {
        case name, description, avatar, cover
        case lastModificationDate
        case prevEntry
    }
}
// MARK: - Avatar
struct Avatar: Codable {
    let data: AvatarData
}
// MARK: - AvatarData
struct AvatarData: Codable {
    let uuid: String
    let width, height, size: Int
    let color: String
    let base64Preview: String?
    let duration: Double?

    enum CodingKeys: String, CodingKey {
        case uuid, width, height, size, color
        case base64Preview = "base64preview"
        case duration
    }
}
// MARK: - PrevEntry
struct PrevEntry: Codable {
    let id: Int
    let title, description: String
}
// MARK: - ItemItem
struct ItemItem: Codable {
    let image: Avatar
}
// MARK: - Counters
struct Counters: Codable {
    let comments, favorites, reposts, views: Int
    let hits: Int
}
// MARK: - Likes
struct Likes: Codable {
    let counterLikes: Int
    let isLiked: Int
    let isHidden: Bool
}

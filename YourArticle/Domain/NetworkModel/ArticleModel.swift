//
//  ArticleModel.swift
//  YourArticle
//
//  Created by Macbook Air on 13.05.2023.
//

import Foundation

struct ArticleResponse: Decodable {
    let results: [ArticleModel]
}

struct ArticleModel: Decodable {
    let url: String
    let title: String
    let abstract: String
    let media: [Media]
}

struct Media: Decodable {
    let mediaMetaData: [MediaMetaData]
    
    enum CodingKeys: String, CodingKey {
        case mediaMetaData = "media-metadata"
    }
}

struct MediaMetaData: Decodable {
    let url: String
    let height: Int
    let width: Int
}

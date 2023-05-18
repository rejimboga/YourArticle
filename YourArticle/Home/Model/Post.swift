//
//  Post.swift
//  YourArticle
//
//  Created by Macbook Air on 14.05.2023.
//

import Foundation

struct Post {
    let url: String
    let title: String
    let descriptionTitle: String
    let media: [ArticleMedia]
}

struct ArticleMedia {
    let mediaMetaData: [ArticleMediaMetaData]
}

struct ArticleMediaMetaData {
    let imageUrl: String
    let height: Int
    let width: Int
}

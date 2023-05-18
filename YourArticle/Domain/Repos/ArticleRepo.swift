//
//  ArticleRepo.swift
//  YourArticle
//
//  Created by Macbook Air on 14.05.2023.
//

import UIKit
import CoreData

final class ArticleRepo {
    // MARK: - Network
    private let network: NetworkManager = .init()
    
    // MARK: - Network request
    @MainActor
    func loadSharedArticles() async throws -> [Post] {
        try await network.getSharedArticles().mapToArticles()
    }
    
    @MainActor
    func loadViewedArticles() async throws -> [Post] {
        try await network.getViewedArticles().mapToArticles()
    }
    
    @MainActor
    func loadEmailedArticles() async throws -> [Post] {
        try await network.getEmailedArticles().mapToArticles()
    }
    
    @MainActor
    func loadDownloadedArticles() async throws -> [Article] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        
        return try context.fetch(fetchRequest)
    }
}


extension Array where Element == ArticleModel {
    func mapToArticles() -> [Post] {
        return self.map { articleModel -> Post in
            let articleMedia = articleModel.media.map { media -> ArticleMedia in
                let mediaMetaData = media.mediaMetaData.map { mediaMetaData -> ArticleMediaMetaData in
                    return ArticleMediaMetaData(imageUrl: mediaMetaData.url,
                                                height: mediaMetaData.height,
                                                width: mediaMetaData.width)
                }

                return ArticleMedia(mediaMetaData: mediaMetaData)
            }

            return Post(url: articleModel.url,
                        title: articleModel.title,
                        descriptionTitle: articleModel.abstract,
                        media: articleMedia)
        }
    }
}

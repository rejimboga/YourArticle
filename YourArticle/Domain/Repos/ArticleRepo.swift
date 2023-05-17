//
//  ArticleRepo.swift
//  YourArticle
//
//  Created by Macbook Air on 14.05.2023.
//

import Foundation

final class ArticleRepo {
    // MARK: - Network
    private let network: NetworkManager = .init()
    
    // MARK: - Network request
    @MainActor
    func loadArticles() async throws -> [ArticleModel] {
        try await NetworkManager().loadViewedArticles()
    }
}

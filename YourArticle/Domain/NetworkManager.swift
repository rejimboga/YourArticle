//
//  NetworkManager.swift
//  YourArticle
//
//  Created by Macbook Air on 13.05.2023.
//

import UIKit
import Alamofire

final class NetworkManager {
    
    @MainActor
    func loadViewedArticles() async throws -> [ArticleModel] {
        return try await AF.request(URLs.Articles.getUrl(period: .thirtyDays,
                                                         path: .shared)).serializingDecodable(ArticleResponse.self).value.results
    }
}

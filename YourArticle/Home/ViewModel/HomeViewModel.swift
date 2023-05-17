//
//  HomeViewModel.swift
//  YourArticle
//
//  Created by Macbook Air on 14.05.2023.
//

import UIKit
import Combine

final class HomeViewModel: BaseViewModel {
    
    typealias Output = HomeOutput
    
    struct HomeOutput: Outputable {
        @Variable var articles: [ArticleModel] = []
        @Variable var result: ViewModelResult = .none
    }
    
    var output: Output = .init()
    
    private var articleRepo = ArticleRepo()
    
    init() {
        fetchArticles()
    }
    
    func numberOfRows() -> Int {
        output.articles.count
    }
}

// MARK: - API
extension HomeViewModel {
    // MARK: - Articles
    func fetchArticles() {
        Task { @MainActor in
            do {
                output.result = .loading
                output.articles = try await articleRepo.loadArticles()
                output.result = .completed
            } catch {
                output.result = .failure(error: URLs.NetworkError.invalidData)
                print(URLs.NetworkError.invalidData.localizedDescription)
            }
        }
    }
}


enum ViewModelResult {
    case failure(error: Error)
    case loading
    case completed
    case none
}

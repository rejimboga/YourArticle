//
//  ViewedViewModel.swift
//  YourArticle
//
//  Created by Macbook Air on 18.05.2023.
//

import UIKit
import Combine

final class ViewedViewModel: BaseViewModel {
    
    typealias Output = HomeOutput
    
    struct HomeOutput: Outputable {
        @Variable var articles: [Post] = []
        @Variable var result: ViewModelResult = .none
    }
    
    var output: Output = .init()
    
    private var articleRepo = ArticleRepo()
    
    init() {
        fetchViewedArticles()
    }
    
    func numberOfRows() -> Int {
        output.articles.count
    }
}

// MARK: - API
extension ViewedViewModel {
    // MARK: - Articles
    func fetchViewedArticles() {
        Task { @MainActor in
            do {
                output.result = .loading
                output.articles = try await articleRepo.loadViewedArticles()
                output.result = .completed
            } catch {
                output.result = .failure(error: URLs.NetworkError.invalidData)
                print(URLs.NetworkError.invalidData.localizedDescription)
            }
        }
    }
}


//
//  BookmarkViewModel.swift
//  YourArticle
//
//  Created by Macbook Air on 18.05.2023.
//

import UIKit
import Combine

final class BookmarkViewModel: BaseViewModel {
    typealias Output = HomeOutput
    
    struct HomeOutput: Outputable {
        @Variable var articles: [Article] = []
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

extension BookmarkViewModel {
    func fetchArticles() {
        Task { @MainActor in
            do {
                output.result = .loading
                output.articles = try await articleRepo.loadDownloadedArticles()
                output.result = .completed
            } catch {
                output.result = .failure(error: URLs.NetworkError.invalidData)
                print(URLs.NetworkError.invalidData.localizedDescription)
            }
        }
    }
}

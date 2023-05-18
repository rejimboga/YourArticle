//
//  MostSharedViewController.swift
//  YourArticle
//
//  Created by Macbook Air on 13.05.2023.
//

import UIKit
import Combine

class MostSharedViewController: BaseViewController {
    // MARK: - UI
    private lazy var articleTableView: ArticleTableView = .init()
    
    // MARK: - ViewModel
    private var viewModel: SharedViewModel = .init()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Most shared"
        constraint()
    }
    
    override func bind() {
        viewModel.output.$articles.ui
            .sink { [weak self] articles in
                self?.articleTableView.articles(articles)
                self?.articleTableView.navController(self?.navigationController ?? UINavigationController())
            }
            .store(in: &bag)
    }
    
    // MARK: - Constraints
    private func constraint() {
        view.fill(with: articleTableView, safeArea: true)
    }

}

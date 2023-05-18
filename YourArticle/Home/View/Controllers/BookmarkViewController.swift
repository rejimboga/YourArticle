//
//  BookmarkViewController.swift
//  YourArticle
//
//  Created by Macbook Air on 18.05.2023.
//

import UIKit

class BookmarkViewController: BaseViewController {
    
    private lazy var articleTableView: UITableView = .init()
        .disableTranslates()
        .dataSource(self)
        .delegate(self)
        .rowHeight(270)
        .separatorColor(.clear)
        .register(DownloadedArticleCell.self, id: DownloadedArticleCell.id)
    
    // MARK: - ViewModel
    private var viewModel: BookmarkViewModel = .init()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bookmark"
        constraint()
    }
    
    override func bind() {
        viewModel.output.$articles.ui
            .sink { [weak self] articles in
                self?.articleTableView.reloadData()
            }
            .store(in: &bag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchArticles()
    }
    
    // MARK: - Constraints
    private func constraint() {
        view.fill(with: articleTableView, safeArea: true)
    }
}

// MARK: - Table view data source
extension BookmarkViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DownloadedArticleCell.id, for: indexPath) as? DownloadedArticleCell
        else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        let article = viewModel.output.articles[indexPath.row]
        cell.configCell(article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DownloadArticleDetailsViewController(downloadArticle: viewModel.output.articles[indexPath.row])
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

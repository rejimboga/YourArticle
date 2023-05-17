//
//  HomeViewController.swift
//  YourArticle
//
//  Created by Macbook Air on 13.05.2023.
//

import UIKit
import Combine

class HomeViewController: BaseViewController {
    // MARK: - UI
    lazy private var articleTableView: UITableView = .init()
        .disableTranslates()
        .dataSource(self)
        .delegate(self)
        .rowHeight(270)
        .separatorColor(.clear)
        .separatorStyle(.none)
        .register(ArticleCell.self, id: "ArticleCell")
    
    // MARK: - ViewModel
    private var viewModel: HomeViewModel = .init()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        constraint()
    }
    
    override func bind() {
        viewModel.output.$articles.ui
            .sink { [weak self] articles in
                self?.articleTableView.reloadData()
            }
            .store(in: &bag)
    }
    
    // MARK: - Private method
    private func constraint() {
        view.fill(with: articleTableView, safeArea: true)
    }

}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell
        else { return UITableViewCell() }
        cell.configCell(viewModel.output.articles[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
}

extension HomeViewController: UITableViewDelegate { }

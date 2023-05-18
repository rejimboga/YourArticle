//
//  ArticleTableView.swift
//  YourArticle
//
//  Created by Macbook Air on 18.05.2023.
//

import UIKit

class ArticleTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    // MARK: - Properties
    private(set) var articles: [Post] = []
    private(set) var navController = UINavigationController()
    
    // MARK: - Initialisation
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Setup()
    private func commonInit() {
        self
            .disableTranslates()
            .dataSource(self)
            .delegate(self)
            .rowHeight(270)
            .separatorColor(.clear)
            .register(ArticleCell.self, id: ArticleCell.id)
    }
    
    #warning("Remove it after implement empty view if user doesn't have an internet connection")
    // MARK: - Table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.id, for: indexPath) as? ArticleCell
        else { return UITableViewCell() }
        
        cell.selectionStyle = .none
        cell.configCell(articles[indexPath.row])
        cell.article(articles[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ArticleDetailsViewController(article: articles[indexPath.row])
        vc.hidesBottomBarWhenPushed = true
        navController.pushViewController(vc, animated: true)
    }
    
    // MARK: - Methods
    @discardableResult
    func articles(_ articles: [Post]) -> Self {
        self.articles = articles
        reloadData()
        return self
    }
    
    @discardableResult
    func navController(_ nav: UINavigationController) -> Self {
        self.navController = nav
        return self
    }
}


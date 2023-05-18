//
//  ArticleDetailsViewController.swift
//  YourArticle
//
//  Created by Macbook Air on 18.05.2023.
//

import UIKit
import SDWebImage

class ArticleDetailsViewController: UIViewController {
    // MARK: - Properties
    private var article: Post
    
    // MARK: - UI
    private let articleTitle: UILabel = .init()
        .disableTranslates()
        .numberOfLines(0)
        .alignment(.center)
        .text("Article title")
        .textColor(.black)
        .font(.bold(size: 16))
    
    private let articleImage: UIImageView = .init()
        .disableTranslates()
    
    private let descriptionTitle: UILabel = .init()
        .disableTranslates()
        .numberOfLines(0)
        .font(.semibold(size: 14))
        .text("Description title")
        .textColor(.gray)
    
    private let openLinkButton: UIButton = .init()
        .disableTranslates()
        .text("Read article")
        .underline(true)
        .textColor(.gray)
        .font(.semibold(size: 12))
        .addTarget(self, selector: #selector(openLink), event: .touchUpInside)

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor(.white)
        constraint()
        configView(article)
    }
    
    init(article: Post) {
        self.article = article
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    // MARK: - Constraints
    private func constraint() {
        view.addSubviews([articleTitle, descriptionTitle, articleImage, openLinkButton])
        articleTitle.fixSides(to: view, constant: 16)
        descriptionTitle.fixSides(to: view, constant: 8)
        articleImage.fixSides(to: view, constant: 8)
        
        NSLayoutConstraint.activate([
            articleTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            descriptionTitle.topAnchor.constraint(equalTo: articleTitle.bottomAnchor, constant: 8),
            openLinkButton.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 8),
            openLinkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            articleImage.topAnchor.constraint(equalTo: openLinkButton.bottomAnchor, constant: 8),
            articleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Methods
    private func configView(_ article: Post) {
        articleTitle.text = article.title
        guard let url = URL(string: article.media.first?.mediaMetaData.last?.imageUrl ?? URLs.Articles.ErrorURL.errorImage.path)
        else { return }
        articleImage.sd_setImage(with: url)
        descriptionTitle.text = article.descriptionTitle
    }
    
    @objc private func openLink() {
        guard let url = URL(string: article.url)
        else { return }
        
        UIApplication.shared.open(url)
    }
}

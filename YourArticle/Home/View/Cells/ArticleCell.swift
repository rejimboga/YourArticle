//
//  ArticleCell.swift
//  YourArticle
//
//  Created by Macbook Air on 15.05.2023.
//

import UIKit
import SDWebImage

class ArticleCell: UITableViewCell {
    // MARK: - UI
    private let cellStack: UIStackView = .init()
        .disableTranslates()
        .distribution(.fillProportionally)
        .spacing(12)
        .axis(.horizontal)
    
    private let articleImage: UIImageView = .init()
        .contentMode(.scaleAspectFit)
        
    private let titleLabel: UILabel = .init()
        .text("Title label")
        .numberOfLines(0)
        .textColor(.black)
        .font(.bold(size: 15))
        .alignment(.center)
    
    private let descriptionTitle: UILabel = .init()
        .disableTranslates()
        .text("Description label")
        .numberOfLines(0)
        .font(.semibold(size: 12))
        .textColor(.gray)
    
    private let favoriteButton: UIButton = .init()
        .disableTranslates()
        .square(CGFloat(24))
        .image(UIImage.CommonKey.empty)
        .addTarget(self, selector: #selector(bookmarkIsTapped(_:)), event: .touchUpInside)
    
    private let separator: UIView = .init()
        .disableTranslates()
        .backgroundColor(.lightGray)
        .height(8)
    
    // MARK: - Initialisation
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraints()
        configUI()
    }
        
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        articleImage.image = nil
        titleLabel.text = nil
        descriptionTitle.text = nil
    }
    
    // MARK: Constraints
    private func constraints() {
        cellStack.addArrangedSubviews([titleLabel, articleImage])
        contentView.addSubviews([cellStack, descriptionTitle, favoriteButton, separator])
        cellStack.fixSides(to: contentView, constant: 16)
        descriptionTitle.fixSides(to: self, constant: 8)
        separator.fixSides(to: self, constant: 0)
        
        NSLayoutConstraint.activate([
            cellStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            descriptionTitle.topAnchor.constraint(equalTo: cellStack.bottomAnchor, constant: 8),
            favoriteButton.topAnchor.constraint(equalTo: descriptionTitle.bottomAnchor, constant: 8),
            favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            separator.topAnchor.constraint(equalTo: favoriteButton.bottomAnchor, constant: 8),
            separator.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
    
    private func configUI() {
        favoriteButton.setImage(UIImage.CommonKey.filled.image, for: .selected)
    }
    
    // MARK: - Private methods
    @objc private func bookmarkIsTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
                sender.isSelected = !sender.isSelected
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    // MARK: - Cell configure
    func configCell(_ value: ArticleModel) {
        titleLabel.text(value.title)
        descriptionTitle.text(value.abstract)
        guard let url = URL(string: value.media.first?.mediaMetaData[1].url ?? URLs.Articles.ErrorImage.errorImage.path)
        else { return }
        articleImage.sd_setImage(with: url)
    }
}

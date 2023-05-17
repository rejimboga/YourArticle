//
//  BaseTabBarViewController.swift
//  YourArticle
//
//  Created by Macbook Air on 17.05.2023.
//

import UIKit

class BaseTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        viewControllers = [setupTabBarItem(with: HomeViewController(),
                                           title: "Most shared",
                                           image: UIImage(systemName: "square.and.arrow.up.fill")),
                           setupTabBarItem(with: SecondViewController(),
                                           title: "Most viewed",
                                           image: UIImage(systemName: "eye.square.fill")),
                           setupTabBarItem(with: SecondViewController(),
                                           title: "Most emailed",
                                           image: UIImage(systemName: "envelope.fill")),
                           setupTabBarItem(with: SecondViewController(),
                                           title: "Bookmark",
                                           image: UIImage(systemName: "bookmark.square.fill"))
        ]
    }
    
    private func setupTabBarItem(with viewController: UIViewController, title: String, image: UIImage?) -> UIViewController{
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}

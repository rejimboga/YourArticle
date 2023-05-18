//
//  BaseTabBarViewController.swift
//  YourArticle
//
//  Created by Macbook Air on 17.05.2023.
//

import UIKit

class BaseTabBarViewController: UITabBarController {
    
    private var sharedNavigation = UINavigationController()
    private var viewedNavigation = UINavigationController()
    private var emailedNavigation = UINavigationController()
    private var bookmarkViewController = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        sharedNavigation.setViewControllers([MostSharedViewController()], animated: true)
        viewedNavigation.setViewControllers([MostViewedViewController()], animated: true)
        emailedNavigation.setViewControllers([MostEmailedViewController()], animated: true)
        bookmarkViewController.setViewControllers([BookmarkViewController()], animated: true)
        
        viewControllers = [setupTabBarItem(with: sharedNavigation,
                                           title: "Most shared",
                                           image: UIImage(systemName: "square.and.arrow.up.fill")),
                           setupTabBarItem(with: viewedNavigation,
                                           title: "Most viewed",
                                           image: UIImage(systemName: "eye.square.fill")),
                           setupTabBarItem(with: emailedNavigation,
                                           title: "Most emailed",
                                           image: UIImage(systemName: "envelope.fill")),
                           setupTabBarItem(with: bookmarkViewController,
                                           title: "Bookmark",
                                           image: UIImage(systemName: "bookmark.square.fill"))]
    }
    
    private func setupTabBarItem(with viewController: UINavigationController, title: String, image: UIImage?) -> UIViewController{
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
}

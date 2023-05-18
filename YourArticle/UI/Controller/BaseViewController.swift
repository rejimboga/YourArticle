//
//  BaseViewControlle.swift
//  YourArticle
//
//  Created by Macbook Air on 14.05.2023.
//

import UIKit
import Combine

class BaseViewController: UIViewController {
    
    var bag = Bag()
    
    init() { super.init(nibName: nil, bundle: nil) }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor(.white)
        bind()
    }
    
    func bind() { }

}

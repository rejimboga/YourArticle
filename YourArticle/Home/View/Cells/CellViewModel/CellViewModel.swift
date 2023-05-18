//
//  CellViewModel.swift
//  YourArticle
//
//  Created by Macbook Air on 18.05.2023.
//

import UIKit
import Combine
import CoreData

final class CellViewModel: BaseViewModel {
    typealias Output = HomeOutput
    
    struct HomeOutput: Outputable {
        @Variable var result: ViewModelResult = .none
    }
    
    var output: Output = .init()
    
    private var articleRepo = ArticleRepo()
    private var delegate = UIApplication.shared.delegate as! AppDelegate
    
    func saveObject(_ article: Post) {
        let context = delegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Article", in: context)
        else { return }
        
        fillObject(article, entity: entity, context: context)
        save(into: context)
    }
    
    private func save(into context: NSManagedObjectContext) {
        do {
            try context.save()
        } catch let error as NSError {
            print(error)
        }
    }
    
    private func fillObject(_ value: Post, entity: NSEntityDescription, context: NSManagedObjectContext) {
        let object = Article(entity: entity, insertInto: context)
        object.title = value.title
        object.descriptionTitle = value.descriptionTitle
        object.articleImage = value.media.first?.mediaMetaData[1].imageUrl
        object.articleUrl = value.url
    }
}


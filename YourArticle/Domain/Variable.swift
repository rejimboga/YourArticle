//
//  Variable.swift
//  YourArticle
//
//  Created by Macbook Air on 15.05.2023.
//

import Foundation
import Combine

@propertyWrapper
final class Variable<Value> {
    
    var wrappedValue: Value {
        get { projectedValue.value }
        set { projectedValue.send(newValue) }
    }
    
    var projectedValue: CurrentValueSubject<Value, Never>
    
    init(wrappedValue: Value) {
        self.projectedValue = .init(wrappedValue)
    }
}

extension CurrentValueSubject {
    
    var ui: AnyPublisher<Output, Failure> {
        self.receive(on: DispatchQueue.main).eraseToAnyPublisher()
    }
    
}

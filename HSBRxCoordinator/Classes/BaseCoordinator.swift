//
//  BaseCoordinator.swift
//
//  Created by Sang bo Hong on 03/07/2019.
//  Copyright © 2019 multiverse. All rights reserved.
//

import Foundation
import RxSwift

open class BaseCoordinator<ResultType> {
    
    typealias CoordinationResult = ResultType
    
    public let disposeBag = DisposeBag()
    private let identifier = UUID()
    private var childCoordinators = [UUID: Any]()
    
    public init() {
        
    }
    
    private func store<T>(coordinator: BaseCoordinator<T>) {
        childCoordinators[coordinator.identifier] = coordinator
    }
    
    private func free<T>(coordinator: BaseCoordinator<T>) {
        childCoordinators[coordinator.identifier] = nil
    }
    
    open func coordinate<T>(to coordinator: BaseCoordinator<T>) -> Observable<T> {
        store(coordinator: coordinator)
        return coordinator.start()
            .do(onNext: { [weak self] _ in self?.free(coordinator: coordinator) })
    }
    
    open func start() -> Observable<ResultType> {
        fatalError("Start method should be implemented.")
    }
}


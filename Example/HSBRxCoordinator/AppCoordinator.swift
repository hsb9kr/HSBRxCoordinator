//
//  AppCoordinator.swift
//  HSBRxCoordinator_Example
//
//  Created by Sang bo Hong on 03/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import HSBRxCoordinator
import RxSwift

class AppCoordinator: BaseCoordinator<Void>  {
    
    private let window: UIWindow
        
    init(window: UIWindow) {

        self.window = window
    }
    
    override func start() -> Observable<Void> {
        return .never()
    }
}
